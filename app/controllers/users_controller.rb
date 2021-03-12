class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy edit_password update_password]
    before_action :verify_logged_in, only: %i[ show edit update destroy edit_password update_password]
    before_action :verify_current_user, only: %i[ edit update destroy edit_password update_password]

    def show
        @setlist = @user.created_setlists.first
        render 'users/show'
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user_id] = @user.id
            redirect_to @user
        else
            render 'users/new'
        end
    end

    def edit
    end

    
    def update
        @email_user = User.find_by(email: user_params[:email])
        @username_user = User.find_by(username: user_params[:username])
        if !@email_user || @email_user == @user
            @user.update_attribute('email', user_params[:email])
        else
            @user.errors.add(:email, "is in use.")
            render 'users/edit' and return 
        end
        if !@username_user || @username_user == @user 
            @user.update_attribute('username', user_params[:username])
        else
            @user.errors.add(:username, "is in use.")
            render 'users/edit' and return
        end
        redirect_to @user, notice: "Settings updated"
    end
    
    def edit_password
    end

    def update_password
        if params[:user][:old_password]
            if !!@user.authenticate(params[:user][:old_password])
                @user.update(user_params)
                if @user.save
                    redirect_to @user, notice: "Password successfully changed"
                else
                    render 'users/edit_password'
                end
            else
                @user.errors.add(:current_password, "is incorrect")
                render 'users/edit_password'
            end
        else
            @user.errors.add(:current_password, "cannot be blank")
            render 'users/edit_password'
        end
    end
    
    def destroy
        @user.owned_arrangements.destroy_all
        if @user.destroy
            session.clear
            redirect_to home_path, notice: "User Deleted"
        else
            render 'user/edit'
        end
    end
    
    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end

        def verify_current_user
            if current_user != @user
                redirect_to home_path, alert: "Access restricted"
            end
        end

end
