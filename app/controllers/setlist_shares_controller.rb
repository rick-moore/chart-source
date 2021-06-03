class SetlistSharesController < ApplicationController
    before_action :set_team, only: %i[ new ]
    def new
        respond_to do |format|
            format.js
        end
    end

    def create
        @team = Team.find_by(id: params[:setlist_share][:team_id])
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

    def destroy
        @setlist_share = SetlistShare.find_by(id: params[:id])
        @team = @setlist_share.team
        if current_user = @team.leader 
            @setlist_share.destroy
            redirect_to @team, notice: "Setlist removed"
        else
            redirect_to @team, notice: "Only the team leader can remove setlists"
        end
    end

    private
        def set_team
            @team = Team.find_by(id: params[:team_id]) 
        end

        def setlist_share_params
            params.require(:setlist_share).permit(:setlist_id, :team_id)
        end
end