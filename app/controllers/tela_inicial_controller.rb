class TelaInicialController < ApplicationController

	def index
		if session[:city_id].present?
			if !params[:alterar].present?
				redirect_to home_path


			else
				
				@url = "../"
			end
		else
			@url = ""
		end
	end
end
