class PainelController < ApplicationController
  
  before_action :authenticate_user!
  before_action :active_user!

  def index
  	@count_user = User.count
  	@count_service = Service.count
  	@count_comment = Comment.count
  end

  def active_user!
  	current_user.status=="ativo"
  end
end
