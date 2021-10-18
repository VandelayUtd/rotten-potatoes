class UsersController < ApplicationController
    skip_before_action :verify_user, only: [:new, :create]

    def new
        redirect_to user_path(current_user) if logged_in
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:alert] = @user.errors.full_messages.join( ", ")
            redirect_to signup_path
        end
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    private 
    
    def user_params 
        params.require(:user).permit(:name, :username, :password)
    end

end
