class ApplicationController < ActionController::Base

  include Pundit
  before_action :authenticate_user!

  before_action :sanitize_devise_params, if: :devise_controller?



 def sanitize_devise_params
   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
   # devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
 end


end
