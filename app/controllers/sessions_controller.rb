class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_username_or_email(session_params[:username])
        if !!user && !!user.authenticate(session_params[:password])
            session[:current_user_id] = user.id
            render 'home/dashboard'
        else
            render 'sessions/new'
        end 
    end

    def destroy
        if logged_in?
            session.clear
        end
        redirect_to home_path
    end

    private
        def session_params
            params.require(:user).permit(:username, :password)
        end
    
end