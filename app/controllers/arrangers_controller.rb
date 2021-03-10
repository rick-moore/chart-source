class ArrangersController < ApplicationController
    before_action :set_arranger, only: :show
    
    def index
        @arrangers = current_user.arrangers
    end

    def show
        if @arranger.owner == current_user
            @arrangements = @arranger.arrangements
            render 'arrangers/show'
        else
            redirect_to home_path
        end
    end

    private 
        def set_arranger
            @arranger = Arranger.find(params[:id])
        end
end