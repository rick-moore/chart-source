class SessionsController < ApplicationController
    def new
    end

    def create
        if !!request.env['omniauth.auth']
            if @user = User.find_by(uid: request.env['omniauth.auth']['uid'])
            else
                email = request.env['omniauth.auth']['info']['email']
                name = request.env['omniauth.auth']['info']['name']
                image = request.env['omniauth.auth']['info']['image']
                uid = request.env['omniauth.auth']['uid']
                provider = request.env['omniauth.auth']['provider']
                characters = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
                random_password = characters.to_a.sort_by { rand }.join[0...20]

                if @user = User.find_by_username_or_email(email)
                    @user.uid = uid
                else
                    @user = User.new(username: name, email: email, uid: uid, password: random_password, provider: provider, name: name, image: image)
                end
            end
            if @user.save
                session[:current_user_id] = @user.id
                redirect_to @user
            else
                redirect_to login_path
            end
        else
            user = User.find_by_username_or_email(session_params[:username])
            if !!user && !!user.authenticate(session_params[:password])
                session[:current_user_id] = user.id
                redirect_to user
            else
                render 'sessions/new'
            end 
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