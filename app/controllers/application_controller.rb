class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :verify_logged_in
    
    def logged_in?
        !!session[:current_user_id]
    end
    
    def current_user
        if logged_in?
            User.find(session[:current_user_id])
        end
    end

    def verify_logged_in
        if !logged_in?
            redirect_to login_path, alert: "You must be logged in to continue"
        end
    end
end
