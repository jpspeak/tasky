class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        home_path
    end
    
    private 
    def store_location
        session[:stored_location] = request.path
    end

    def stored_location
        session[:stored_location]
    end

end
