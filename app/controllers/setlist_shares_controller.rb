class SetlistSharesController < ApplicationController
    before_action :set_team, only: %i[ new ]
    def new
        respond_to do |format|
            format.js
        end
    end

    def create
        @team = Team.find_by(params[:setlist_share][:team_id])
        if @team.is_member_or_leader?(current_user)
            if @ss = SetlistShare.find_by(setlist_share_params)
                redirect_to @team, alert: "That setlist has already been shared"
            else
                @ss = SetlistShare.create(setlist_share_params)
                if @ss.save
                    respond_to do |format|
                        format.js
                    end
                else   
                    render 'team/show', alert: 'Something went wrong'
                end
            end
        else
            redirect_to home_path
        end
    end

    private
        def set_team
            @team = Team.find_by(params[:team_id]) 
        end

        def setlist_share_params
            params.require(:setlist_share).permit(:setlist_id, :team_id)
        end
end