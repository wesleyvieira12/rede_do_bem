class HomeController < ApplicationController
	def index
		if session[:city_id].present?
			@city = City.find(session[:city_id])
		else
			@city = City.find(params[:id_cidade])
			session[:city_id] = @city.id
		end
	end
end
