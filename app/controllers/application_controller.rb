class ApplicationController < ActionController::Base

    before_action :verify_user

    private

    def verify_user
        redirect_to root_path unless logged_in?
    end
    
    def current_user 
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

end
