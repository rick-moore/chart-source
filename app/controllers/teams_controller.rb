class TeamsController < ApplicationController
    before_action :set_team, only: %i[ show edit update destroy ]
    before_action :verify_logged_in
    before_action :verify_team_leader, only: %i[ edit update destroy ]
    
    def index
        @teams = current_user.teams
        @led_teams = current_user.led_teams
    end

    def show
        if @team.is_member_or_leader?(current_user)
            @membership = Membership.find_by(user: current_user, team: @team)
            render 'teams/show'
        else
            redirect_to user_teams_path(current_user), alert: "You are not a member of that team"
        end
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.create(team_params)
        @team.leader = current_user
        if @team.save
            redirect_to teams_path, notice: "Team Successfully Created"
        else
            render 'teams/new'
        end
    end

    def edit
        @members = @team.members
        render 'teams/edit'
    end

    def update
        @members = @team.members
        if @team.is_leader?(current_user)
            @team.update(team_params)
            if @team.save
                redirect_to @team
            else
                render 'teams/edit'
            end
        else
            redirect_to @team, alert: "Only team leaders can edit team settings"
        end
    end

    def destroy
        if @team.destroy
            redirect_to teams_path, notice: "Team Successfully Deleted"
        else
            render 'teams/edit'
        end
    end



    private
        def set_team
            @team = Team.find(params[:id])
        end

        def team_params
            params.require(:team).permit(:name)
        end

        def verify_team_leader
            if !@team.is_leader?(current_user)
                redirect_to @team, alert: "Only team leaders can edit team settings"
            end
        end
end