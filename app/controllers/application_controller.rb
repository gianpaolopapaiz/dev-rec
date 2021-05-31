class ApplicationController < ActionController::Base
  before_action :authenticate_developer!
  before_action :authenticate_customer!

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters_customer, if: :customers_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :skills, :years_experience, :github_url, :age, :phone])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :skills, :years_experience, :github_url, :age, :phone])
  end

end
