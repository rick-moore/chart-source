class SessionsController < ApplicationController
    def new
    end

    def create
        if !!request.env['omniauth.auth']
            if @user = User.find_by(uid: request.env['omniauth.auth']['uid'])
                session[:current_user_id] = @user.id
                redirect_to @user and return
            elsif @user = User.find_by_username_or_email(request.env['omniauth.auth']['info']['email'])
                @user.uid = request.env['omniauth.auth']['uid']
            else
                @user = User.new(params_from_omniauth)
            end
            if @user.save
                session[:current_user_id] = @user.id
                redirect_to @user
            else
                redirect_to login_path, alert: "Something Went Wrong, Please Try again."
            end
        else
            @user = User.find_by_username_or_email(session_params[:username])
            if !!@user && !!@user.authenticate(session_params[:password])
                session[:current_user_id] = @user.id
                redirect_to @user
            else
                flash.now[:alert] = "Incorrect Username or Password"
                render 'sessions/new'
            end 
        end
    end

    def destroy
        if logged_in?
            session.clear
        end
        redirect_to home_path, notice: "Succcessfully Logged Out"
    end

    private
        def session_params
            params.require(:user).permit(:username, :password)
        end

        def params_from_omniauth
            random_number = rand(1.5..2).to_s.slice(2...)
            characters = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
            
            {username: "guest"+random_number,
            email: request.env['omniauth.auth']['info']['email'],
            name: request.env['omniauth.auth']['info']['name'],
            image: request.env['omniauth.auth']['info']['image'],
            uid: request.env['omniauth.auth']['uid'],
            provider: request.env['omniauth.auth']['provider'],
            password: characters.to_a.sort_by { rand }.join[0...20]}
        end
end