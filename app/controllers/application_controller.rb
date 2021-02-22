class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :image, :acceptable_area])
  end

  def after_sign_in_path_for(resource)
    if current_engineer
      engineers_path
    elsif current_customer
      customers_path
    else
      root_path
    end
  end
  
end
