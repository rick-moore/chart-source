class ArrangementsController < ApplicationController
    before_action :set_arrangement, :set_user, only: :show

    def show
        if @arrangement.owner == @user && current_user == @user
            render 'arrangements/show'
        else
            redirect_to home_path
        end
    end

    private
        def set_arrangement
            @arrangement = Arrangement.find(params[:id])
        end

        def set_user
            @user = User.find(params[:user_id])
        end
end