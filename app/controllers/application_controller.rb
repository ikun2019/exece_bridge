class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  rescue_from SecurityError do |exception|
    redirect_to customers_path, notice: "管理者権限がありません"
  end

  private
  def authenticate_admin_user!
    raise SecurityError unless current_customer.try(:admin?)
  end
  

  def devise_parameter_sanitizer
    if resource_class == Customer
      Customer::ParameterSanitizer.new(Customer, :customer, params)
    elsif resource_class == Engineer
      Engineer::ParameterSanitizer.new(Engineer, :engineer, params)
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if current_engineer && (current_engineer.premium != true)
      cards_path
    elsif current_engineer && (current_engineer.premium == true)
      engineers_path
    elsif current_customer
      customers_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_engineer && (current_engineer.premium != true)
      cards_path
    elsif current_engineer && (current_engineer.premium == true)
      engineers_path
    elsif current_customer
      customers_path
    else
      root_path
    end
  end
  
  
end
