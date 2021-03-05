class ArrangersController < ApplicationController
    before_action :set_arranger, only: :show
    
    # This path should always be nested in a user path 
    # You should only be able to view your owned arrangements
    def show
        if @arranger.owner == current_user
            @user = User.find(params[:user_id])
            @arrangements = @arranger.arrangements.reject{|arrangement| !arrangement.belongs_to_user(@user)}
        else
            redirect_to home_path
        end
    end

    private 
        def set_arranger
            @arranger = Arranger.find(params[:id])
        end
end