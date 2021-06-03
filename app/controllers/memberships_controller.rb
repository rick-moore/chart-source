class MembershipsController < ApplicationController
    before_action :verify_logged_in
    before_action :set_membership, only: %i[ destroy edit update ]

    def create
        @team = Team.find_by(id: membership_params[:team_id])
        verify_team_leader
        if @user = User.find_by_username_or_email(membership_params[:email])
            if @membership = Membership.find_by(user: @user, team: @team)
                redirect_to edit_team_path(@team), alert: "That person is already a member of this team"
            else
                @membership = Membership.create(user: @user, team: @team, display_name: @user.username)
                if @membership.save
                    respond_to do |format|
                        @members = @team.members
                        format.js
                    end
                else
                    render 'team/edit'
                end
            end
        else
            redirect_to 'teams/edit', alert: "That account cannot be found"
        end
    end

    def destroy
        @team = Team.find_by(id: @membership.team.id)
        verify_team_leader
        if @membership.destroy
            respond_to do |format|
                @members = @team.members
                format.js
            end
        else
            render edit_team_path(@team)
        end
    end

    def edit
        @team = @membership.team
        @user = current_user
    end

    def update
        @team = @membership.team
        if @membership.update(membership_params)
            redirect_to @team
        end
    end

    private
        def membership_params
            params.require(:membership).permit(:team_id, :user_id, :email, :display_name)
        end
        
        def set_membership
            @membership = Membership.find_by(id: params[:id])
        end

        def verify_team_leader
            if !@team.is_leader?(current_user)
                redirect_to @team, alert: "Only team leaders can edit memberships"
            end
        end
end
