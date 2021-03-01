class ArrangersController < ApplicationController
    before_action :set_arranger, only: :show
    
    # This path should always be nested in a user path 
    # You should only be able to view your owned arrangements
    def show
        @user = User.find(params[:user_id])
        @arrangements = @arranger.arrangements.reject{|arrangement| !arrangement.belongs_to_user(@user)}
    end

    private 
        def set_arranger
            @arranger = Arranger.find(params[:id])
        end
end