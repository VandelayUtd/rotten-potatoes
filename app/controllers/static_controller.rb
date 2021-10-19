class StaticController < ApplicationController
    skip_before_action :verify_user
    skip_before_action :verify_authenticity_token

    def home
         redirect_to user_path(current_user) if logged_in?
        
    end
end
