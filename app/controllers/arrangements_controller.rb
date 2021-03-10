class ArrangementsController < ApplicationController
    before_action :set_arrangement, only: %i[ show edit destroy ]
    before_action :set_user, only:  :new 

    def index
        if params[:team_id]
            @team = Team.find_by(id: params[:team_id]) 
            if @team && @team.is_member_or_leader?(current_user)
                @arrangements = @team.arrangements
                @list_title = @team.name
                render 'arrangements/index'
            else
                redirect_to user_teams_path(current_user)
            end
        else
            set_user
            if @user == current_user
                @arrangements = @user.owned_arrangements
                @list_title = @user.username
                render 'arrangements/index'
            else
                redirect_to login_path
            end
        end
    end
    
    def show
        @team = Team.find_by(id: params[:team_id])
        if @arrangement.belongs_to_user(current_user) || @arrangement.has_team_access(current_user)
            render 'arrangements/show'
        else
            redirect_to current_user
        end
    end

    def new
        if logged_in?
            @arrangement = Arrangement.new
            render 'arrangements/new'
        else
            redirect_to login_path    
        end
    end

    def create
        @user = User.find_by(id: params[:user_id])
        a = Arrangement.new(arrangement_params)
        a.owner = @user
        a.genres.each do |genre|
            @user.genres << genre
        end
        byebug
        if a.save
            redirect_to a
        else
            render new_user_arrangement_path(@user, a)
        end
    end

    def edit
        if @arrangement.belongs_to_user(current_user)
            render 'arrangements/edit'
        else
            redirect_to user_arrangements_path(current_user)
        end
    end

    def destroy
        if @arrangement.belongs_to_user(current_user)
            @arrangement.destroy
            redirect_to user_arrangements_path(current_user)
        else
            redirect_to user_arrangements_path(current_user)
        end
    end

    private
        def set_arrangement
            @arrangement = Arrangement.find(params[:id])
        end

        def set_user
            @user = User.find(params[:user_id])
        end

        def arrangement_params
            params.require(:arrangement).permit(:user_id, 
                                                :key, 
                                                :tempo, 
                                                :genre_input, 
                                                :song_attributes => [:name, :user_id], 
                                                :artist_attributes => [:name, :user_id], 
                                                :arranger_attributes => [:name, :user_id], 
                                                :genre_attributes => [:names, :user_id]
            )
        end
end