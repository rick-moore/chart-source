class MembershipsController < ApplicationController
    before_action :verify_logged_in

    def create
        @team = Team.find_by(id: membership_params[:team_id])
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
        @membership = Membership.find_by(id: params[:id])
        @team = Team.find_by(id: @membership.team.id)
        if @team.is_leader?(current_user)
            if @membership.destroy
                respond_to do |format|
                    @members = @team.members
                    format.js
                end
            else
                render edit_team_path(@team)
            end
        else
            redirect_to home_path
        end
    end

    def edit
        @membership = Membership.find_by(id: params[:id])
        @team = @membership.team
        @user = current_user
    end

    def update
        @membership = Membership.find_by(id: params[:id])
        @team = @membership.team
        @membership.update(membership_params)
        if @membership.save
            redirect_to @team
        end
    end

    private
        def membership_params
            params.require(:membership).permit(:team_id, :user_id, :email, :display_name)
        end
end