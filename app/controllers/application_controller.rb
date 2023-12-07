class ApplicationController < ActionController::Base
  before_action :authenticate_user! , only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?


  def home
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  rescue_from Faraday::TooManyRequestsError, with: :redirect_to_429
  def redirect_to_429
    redirect_to("/428.html")
  end

end
