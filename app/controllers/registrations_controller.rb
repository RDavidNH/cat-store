class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?	
   
    protected  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, except: [:password], keys: [:firstname, :lastname, :description])

    end  

#   protected  
#   def after_sign_up_path_for(resource)
#     #   '/cities/new'
#   end
end