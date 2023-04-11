class ApplicationController < ActionController::API
    before_action :set_cors_headers
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

      def set_cors_headers
        headers['Access-Control-Allow-Origin'] = 'https://bikerace-oc.netlify.app/'
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
        headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
      end

end
