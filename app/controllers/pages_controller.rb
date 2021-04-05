class PagesController < ApplicationController
    
    def welcome
        if user_signed_in?
            redirect_to home_path
        else
            render 'pages/welcome'
        end
    end

end
