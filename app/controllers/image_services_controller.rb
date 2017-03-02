class ImageServicesController < ApplicationController
  before_action :set_image_service, only: [:show, :edit, :update, :destroy]

  # GET /image_services
  # GET /image_services.json
  def index
    @image_services = ImageService.all
  end

  # GET /image_services/1
  # GET /image_services/1.json
  def show
  end

  # GET /image_services/new
  def new
    @image_service = ImageService.new
  end

  # GET /image_services/1/edit
  def edit
  end

  # POST /image_services
  # POST /image_services.json
  def create
    @image_service = ImageService.new(image_service_params)

    respond_to do |format|
      if @image_service.save
        format.html { redirect_to @image_service, notice: 'Image service was successfully created.' }
        format.json { render :show, status: :created, location: @image_service }
      else
        format.html { render :new }
        format.json { render json: @image_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_services/1
  # PATCH/PUT /image_services/1.json
  def update
    respond_to do |format|
      if @image_service.update(image_service_params)
        format.html { redirect_to @image_service, notice: 'Image service was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_service }
      else
        format.html { render :edit }
        format.json { render json: @image_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_services/1
  # DELETE /image_services/1.json
  def destroy
    @image_service.destroy
    respond_to do |format|
      format.html { redirect_to image_services_url, notice: 'Image service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_service
      @image_service = ImageService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_service_params
      params.require(:image_service).permit(:avatar, :service_id)
    end
end
