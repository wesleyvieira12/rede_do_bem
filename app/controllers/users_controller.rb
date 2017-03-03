class UsersController < ApplicationController
  
  require 'will_paginate/array'
  
  before_action :authenticate_user!
  before_action :check
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def update?
    authorize @user, :admin
    true
  end

  def admin?
    current_user.kind == "administrator"
  end

  def check
    if current_user.status=="inativo"
      sign_out(current_user)
      redirect_to home_path
    end
  end

  def report

    @comment = Comment.find_by_id(params[:id])
    @comment.report = true

    respond_to do |format|

      if @comment.save
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comentário denunciado.' }
        format.json { render :show, status: :created, location: service_path(@comment.service_id) }
      else
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comentário não denunciado.' }
        format.json { render :show, status: :created, location: service_path(@comment.service_id) }
      end

    end

  end

  # GET /users
  # GET /users.json
  def index

    

    if params[:name]==nil

    @users_professional2 = User.where(professional_id: current_user.id)

    @users_professional = Array.new

    @users_professional2.each do |user|
      @users_professional.push(user)
    end

    @services_professional = Service.where(user_professional_id: current_user.id, status: "ativo")

    @users_all = User.all

    @services_professional.each do |service|

      @users_all.each do |user|

        if user.id==service.user_client_id
          @users_professional.push(user)
        end
      end
    end

  else

    name = params[:name].to_s

    @users_professional2 = User.where(professional_id: current_user.id)

    @users_professional = Array.new

    @users_professional2.each do |user|
      if user.name==name
        @users_professional.push(user)
      end
    end

    @services_professional = Service.where(user_professional_id: current_user.id, status: "ativo")

    @users_all = User.all

    @services_professional.each do |service|

      @users_all.each do |user|

        if user.id==service.user_client_id and user.name==name
          @users_professional.push(user)
        end
      end
    end

  end
    
    @users_professional = @users_professional.paginate(:page => params[:page], :per_page => 8)

    @users_admin = User.all
    @users_admin = @users_admin.paginate(:page => params[:page], :per_page => 8)

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def change

    @user_all = User.all

    @user_all.each do |user|

      if user.id==params[:id].to_i
        @user_here = user
      end
    end

    respond_to do |format|

      if @user_here.status=="ativo"
        @user_here.status="inativo"
        @user_here.save
        format.html { redirect_to user_path, notice: 'Status Alterado.' }
        format.json { render :show, status: :created, location: user_path }
      else
        @user_here.status="ativo"
        @user_here.save
        format.html { redirect_to user_path, notice: 'Status Alterado.' }
        format.json { render :show, status: :created, location: user_path }
      end

    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    respond_to do |format|

      @user[:status] = 1

      if @user.save
        format.html { redirect_to root_path, notice: 'Usuario criado, espere a ativação do seu cadastro.' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city_id, :category_id, :kind, :email, :password, :password_confirmation, :perfil, :professional_id)
    end
end
