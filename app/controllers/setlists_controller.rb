class SetlistsController < ApplicationController
    def update
    end

    def show
        @setlist = Setlist.find(params[:id])
        @user = User.find_by(params[:user_id])
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @setlist = Setlist.new
        respond_to do |format|
            format.js
        end
    end
    
    def create
        @setlist = Setlist.new(setlist_params)
        @user = User.find_by(id: params[:user_id])
        @setlist.creator = @user
        @setlist.save
        respond_to do |format|
            format.js { render partial: 'create' }
        end
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
end