class SetlistsController < ApplicationController
    before_action :verify_logged_in
    before_action :set_setlist, only: %i[ show destroy ]
    
    def index 
        @setlists = current_user.created_setlists
    end
    
    def update
    end

    def show
        @user = current_user
        if @team = Team.find_by(id: params[:team_id])
            @setlist_share = SetlistShare.find_by(team_id: @team.id, setlist_id: @setlist.id)
        end
    end

    def new
        @user = current_user
        @setlist = Setlist.new
        respond_to do |format|
            format.js
        end
    end
    
    def create
        @setlist = Setlist.new(setlist_params)
        @user = current_user
        @setlist.creator = @user
        @setlist.save
        respond_to do |format|
            format.js { render partial: 'create' }
        end
    end

    def destroy
        verify_current_user
        @setlist.destroy
        redirect_to home_path, notice: "Setlist Deleted" 
    end

    def populate_setlist
        @setlist = Setlist.find(params[:setlist_id])
        @user = current_user
        respond_to do |format|
            format.js { render partial: 'populate_setlist' }
        end
    end


    private
        def setlist_params
            params.require(:setlist).permit(:name, :team_id, :creator_id)
        end

        def set_setlist
            @setlist = Setlist.find_by(id: params[:id])
        end

        def verify_current_user
            if @setlist.creator != current_user
                redirect_to home_path, alert: "You can only edit your own setlists"
            end
        end
end