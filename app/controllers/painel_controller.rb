class PainelController < ApplicationController
  
  before_action :authenticate_user!

  before_action :check

  def index
  	@count_user = User.count
  	@count_service = Service.count
  	@count_comment = Comment.count
  end

  def check
  	if current_user.status=="inativo"
  		 sign_out(current_user)
  		 redirect_to home_path
  	end
  end

end
