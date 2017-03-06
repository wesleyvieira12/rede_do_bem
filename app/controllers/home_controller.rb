class HomeController < ApplicationController
	before_action :set_city, only: [:index, :busca, :show_professional,  :show_service]
	before_action :set_category, only: [:index, :busca, :show_professional,  :show_service]
	before_action :set_busca, only: [:index, :busca, :show_professional,  :show_service]

	def index
		
		@photos = ImageSlider.all
		@sobre = Sobre.first

		@images_all = ImageService.order("id DESC")

		@images = Array.new

		@images_all.each do |image|
			if image.service.user_professional.city_id == @city.id
				@images.push(image)

				if @images.count>7
					break
				end
			end
		end

		#Usuarios de uma determinada cidade
		#kind: 0(cliente), 1(professional), 2(administrator)
		
		#@users = @q.result().where(kind:1, status: "ativo", destaque: true, city_id: @city)

		@users = @q.result().where(kind:1, status: "ativo", city_id: @city)

		@categories = @users.joins("INNER JOIN categories c ON users.category_id = c.id").select(:category_id).distinct

		@comments = Comment.joins("INNER JOIN services s ON comments.service_id = s.id INNER JOIN users u ON u.id = s.user_professional_id AND u.city_id = #{@city.id} ").order("id DESC").limit(5)

	end

	def busca

		if !params[:id].present?
			
	  		@users = @q.result().where(kind: 1, city_id: @city, status: "ativo")
  		else
  			
  			@users = User.where(category_id: params[:id], city_id: @city, status: "ativo")
  		end
	end

	def show_professional
		@user = User.find_by_id(params[:id])
		@services = Service.where(user_professional_id: @user.id, status: "ativo")
	end
	def show_service
		@service = Service.find_by_id(params[:id].to_i)
		@images = ImageService.where(service_id: @service.id)
		@comments = Comment.where(service_id: @service.id, status: "ativo")
	end
	private
    
    def set_busca
    	@q = User.ransack(params[:q])
    end

    def set_category
    	@categories = Category.joins("INNER JOIN users u ON u.category_id = categories.id AND u.city_id = #{@city.id}")
    end

    def set_city

      	if session[:city_id].present?

      		if params[:id_cidade].present?
      		
      			@city = City.find(params[:id_cidade])
				session[:city_id] = @city.id
      		
      		else
			
				@city = City.find(session[:city_id])
      		
      		end

		else
			if params[:id_cidade].present?
				@city = City.find(params[:id_cidade])
				session[:city_id] = @city.id
			else
				redirect_to root_url
			end
		end
    end

end
