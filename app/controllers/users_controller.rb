class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    def index 
        @users = User.all
    end

    def show
        if @user == current_user
            render 'users/show'
        else
            redirect_to home_path
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
    private
        def set_user
            @user = User.find(params[:id])
        end

end
