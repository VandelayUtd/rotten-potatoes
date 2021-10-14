class StaticController < ApplicationController
    skip_before_action :verify_user
    def home
         redirect_to user_path(current_user) if logged_in
        
    end
end
