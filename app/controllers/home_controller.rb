class HomeController < ApplicationController
	before_action :set_city, only: [:index, :busca]
	before_action :set_category, only: [:index, :busca]
	def index
		#Usuarios de uma determinada cidade
		@q = User.ransack(params[:q])
		@users = @q.result().where(kind:1, city_id: @city)
		@users = @users.joins("INNER JOIN categories c ON users.category_id = c.id").distinct

		
		@comments = Comment.joins("INNER JOIN services s ON comments.service_id = s.id INNER JOIN users u ON u.id = s.user_professional_id AND u.city_id = #{@city.id}").order("id DESC").limit(5)
	end

	def busca

		if !params[:id].present?
			@q = User.ransack(params[:q])
	  		@users = @q.result().where(kind: 1, city_id: @city)
  		else
  			@q = User.ransack(params[:q])
  			@users = User.where(category_id: params[:id])
  		end
	end

	private
    
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
