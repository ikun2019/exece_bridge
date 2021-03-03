class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  private
  def devise_parameter_sanitizer
    if resource_class == Customer
      Customer::ParameterSanitizer.new(Customer, :customer, params)
    else
      super
    end
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
