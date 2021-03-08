class HomeController < ApplicationController
    def landing
        render 'home/index'
    end

    def index
        if logged_in?
            redirect_to current_user
        else
            redirect_to login_path
        end
    end
end