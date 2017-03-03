class ServicesController < ApplicationController
  
  require 'will_paginate/array'

  before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    
      @q = Service.ransack(params[:q])
      @services_professional = @q.result(distinct: true).where(user_professional_id: current_user.id)
      @services_professional = @services_professional.paginate(:page => params[:page], :per_page => 8)

      @q = Service.ransack(params[:q])
      @services_cliente = @q.result(distinct: true).where(user_client_id: current_user.id)
      @services_cliente = @services_cliente.paginate(:page => params[:page], :per_page => 8)

      @q = Service.ransack(params[:q])
      @services_admin = @q.result(distinct: true)
      @services_admin = @services_admin.paginate(:page => params[:page], :per_page => 8)

  end

  # GET /services/1
  # GET /services/1.json
  def show

    @services = Service.where(id: params[:id].to_i)

    @comments_aux = Comment.all
    @comments = Array.new

    @services.each do |service|
      @comments_aux.each do |comment|
        if comment.service_id==service.id
          @comments.push(comment)
        end
      end
    end

    @comments = @comments.paginate(:page => params[:page], :per_page => 4)
    
    @photos = Array.new

    @todas = ImageService.all

    @todas.each do |cada|
      if cada.service_id==params[:id].to_i 
        @photos.push(cada)
      end
    end

  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create

    @service = Service.new(service_params)
    @service.user_professional_id = current_user.id

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:description, :user_client_id, :user_professional_id, :status, :image_services_attributes => [:id, :avatar, :service_id, :_destroy])
    end
end
