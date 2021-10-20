class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    skip_before_action :verify_user, only: [:new, :create]
    # skip_before_action :verify_authenticity_token, only: :create



    def new
         @user = User.new
    end

    def create 
        if auth_hash
            @user = User.create_by_github(auth_hash)
            @user.name = auth_hash[:info][:name]
            @user.save
            session[:user_id] = @user.id
        else 
            @user = User.find_by(username: params[:username])
            authenticated = user.try(:authenticate, params[:password])
            return head(:forbidden) unless authenticated
            @user = user
            session[:user_id] = @user.id
        end
        redirect_to @user
    end

    def destroy 
        session.delete :user_id
        redirect_to "/"
    end

    protected   

    def auth_hash
        request.env['omniauth.auth']
    end
    

end
