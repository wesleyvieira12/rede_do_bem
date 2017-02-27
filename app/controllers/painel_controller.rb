class PainelController < ApplicationController
  before_action :authenticate_user!
  def index
  	@count_user = User.count
  	@count_service = Service.count
  	@count_comment = Comment.count
  end
end
