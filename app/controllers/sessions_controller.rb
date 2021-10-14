class SessionsController < ApplicationController
    skip_before_action :verify_user, only: [:new, :create]


    def new
         @user = User.new
    end

    def create 
        @user = User.find_by(username: params[:username])
        if @user.try(:authenticate, params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:error] = "sorry please try again"
            redirect_to login_path
        end
    end

    def destroy 
        session.delete :user_id
        redirect_to "/"
    end
end
