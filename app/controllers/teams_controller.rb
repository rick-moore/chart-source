class TeamsController < ApplicationController
    before_action :set_team, only: %i[ show edit ]
    
    def index
        if logged_in?
            @teams = current_user.teams
            @led_teams = current_user.led_teams
        else
            redirect_to login_path
        end
    end

    def show
        if logged_in?
            if @team.is_member_or_leader?(current_user)
                @membership = Membership.find_by(user: current_user, team: @team)
                render 'teams/show'
            else
                redirect_to user_teams_path(current_user)
            end
        else
            redirect_to login_path
        end
    end

    def edit
        if logged_in?
            if @team.is_leader?(current_user)
                @members = @team.members
                render 'teams/edit'
            else
                redirect_to home_path
            end
        else
            redirect_to login_path
        end
    end

    private
        def set_team
            @team = Team.find(params[:id])
        end
end