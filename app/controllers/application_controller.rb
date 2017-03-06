class ApplicationController < ActionController::Base
  
  include Pundit
  protect_from_forgery with: :exception
  # Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    update_attrs = [:current_password, :name, :city_id, :category_id, :kind, :status, :email, :password, :password_confirmation, :perfil]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs

  end

  def after_sign_in_path_for(resource)
  	painel_path
  end

  
end
