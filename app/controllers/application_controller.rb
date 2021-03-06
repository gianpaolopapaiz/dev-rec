class ApplicationController < ActionController::Base
  devise_group :member, contains: [:customer, :developer]
  before_action :authenticate_member!

#  before_action :authenticate_customer!
#  before_action :authenticate_developer! 

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters_customer, if: :customers_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :skills, :years_experience, :github_url, :age, :phone, :photo, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :skills, :years_experience, :github_url, :age, :phone, :photo, :avatar])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)     
      customer_path(current_customer)
    else
      developer_path(current_developer)
    end
  end
end
