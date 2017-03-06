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

  def desactive
    @user = User.find_by_id(params[:id].to_i)
    @user.status = "desativo"
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

    name = params[:name].to_s

    @users_professional2 = User.where(professional_id: current_user.id)
    @services_other2 = User.where("name LIKE :l_name", {:l_name => "#{name}%"})

    @users_professional = Array.new

    @users_professional2.each do |user|
      @services_other2.each do |user2|
        if user2.id==user.id
          @users_professional.push(user)
        end
      end
    end

    @services_professional = Service.where(user_professional_id: current_user.id, status: "ativo")
    @services_other = User.where("name LIKE :l2_name", {:l2_name => "#{name}%"})

    @users_all = User.all

    @services_professional.each do |service|
      @services_other.each do |user2|
        @users_all.each do |user|
          if user.id==service.user_client_id and user.id==user2.id
            @users_professional.push(user)
          end
        end

      end
    end
    
    @users_professional = @users_professional.uniq
    @users_professional = @users_professional.paginate(:page => params[:page], :per_page => 8)

    @users_admin = User.where("name LIKE :l3_name", {:l3_name => "#{name}%"})
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

    if current_user.kind=="administrator"

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

  elsif current_user.kind=="professional" and @user_here.actived==false

    @user_here.actived = true

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
    @user.status="ativo"
    @user.professional_id = current_user.id

    respond_to do |format|

      if @user.save
        format.html { redirect_to users_path, notice: 'Usuário criado, espere a ativação do seu cadastro.' }
        format.json { render :show, status: :created, location: users_path }
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
      params.require(:user).permit(:name, :city_id, :category_id, :kind, :email, :password, :password_confirmation, :perfil, :professional_id, :phone, :fixo, :whatsapp)
    end
end
