class HomeController < ApplicationController
    def landing
        render 'home/index'
    end

    def home
        if logged_in?
            redirect_to current_user
        else
            redirect_to landing_page_path
        end
    end
end