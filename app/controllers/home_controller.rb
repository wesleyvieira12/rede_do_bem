class HomeController < ApplicationController
	def index
		@city = City.find(params[:id_cidade])
	end
end
