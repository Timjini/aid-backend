class ApplicationController < ActionController::API
  # protect_from_forgery
  # before_filter :cors_preflight_check
  # after_filter :cors_set_access_control_headers
    before_action :configure_permitted_parameters,
    if: :devise_controller?
      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
        devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
      end
    private
  
      def ensure_current_user_is_superadmin!
        authenticate_user!
  
        unless current_user.super_admin?
          redirect_to root_path, status: :forbidden, alert: "Unauthorized Access!"
        end
      end

    #   def cors_set_access_control_headers
    #     headers['Access-Control-Allow-Origin'] = '*'
    #     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #     headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
    #     headers['Access-Control-Max-Age'] = "1728000"
    # end
    
    # def cors_preflight_check
    #   if request.method == "OPTIONS"
    #     headers['Access-Control-Allow-Origin'] = 'http://localhost'
    #     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    #     headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
    #     headers['Access-Control-Max-Age'] = '1728000'
    #     render :text => '', :content_type => 'text/plain'
    #   end
    # end
end
