class Api::ApplicationController < ApplicationController
   
    skip_before_action(:verify_authenticity_token)
  
    private
    def authenticate_user!
      if not current_user.present?
        render(json: {status: 401}, status: 401) # Unauthorized
      end
    end
    
end
