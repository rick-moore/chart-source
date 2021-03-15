class ArrangementsController < ApplicationController
    before_action :set_arrangement, only: %i[ show edit update destroy ]
    before_action :verify_logged_in


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
            @arrangements = current_user.owned_arrangements
            @list_title = current_user.username
            render 'arrangements/index'
        end
    end
    
    def show
        @team = Team.find_by(id: params[:team_id])
        if @arrangement.belongs_to_user(current_user) || @arrangement.has_team_access(current_user)
            render 'arrangements/show'
        else
            redirect_to current_user, alert: "You don't have access to this arrangement"
        end
    end

    def new
        @arrangement = Arrangement.new
        @arrangement.charts.build
        @arrangement.song = Song.new
        @arrangement.artist = Artist.new
        @arrangement.arranger = Arranger.new
        @user = current_user
        render 'arrangements/new'
    end

    def create
        @user = current_user
        @arrangement = Arrangement.new(arrangement_params)
        @arrangement.owner = @user
        @arrangement.genres.each do |genre|
            @user.genres << genre
        end
        if @arrangement.save
            redirect_to @arrangement
        else
            render new_arrangement_path
        end
    end

    def edit
        if @arrangement.belongs_to_user(current_user)
            @user = current_user
            @arrangement.artist = Artist.new unless @arrangement.artist
            render 'arrangements/edit'
        else
            redirect_to arrangements_path, alert: "You can only edit your own arrangements" 
        end
    end

    def update
        @user = current_user
        if @user == @arrangement.owner
            @arrangement = Arrangement.find_by(id: params[:id])
            @arrangement.update(arrangement_params)
            @arrangement.genres.each do |genre|
                @user.genres << genre unless @user.genres.include?(genre)
            end
            genre_cleanup

            if @arrangement.save
                redirect_to @arrangement
            else
                render new_arrangement_path
            end
        else
            redirect_to arrangements_path, alert: "You can only update your own arrangements"
        end 
    end


    def destroy
        if @arrangement.belongs_to_user(current_user)
            @arrangement.destroy
            redirect_to arrangements_path, :notice => "Arrangement Deleted"
        else
            redirect_to arrangements_path, :alert => "You cannot delete an arrangement that does not belong to you."
        end
    end

    private
        def set_arrangement
            @arrangement = Arrangement.find(params[:id])
        end

        def arrangement_params
            params.require(:arrangement).permit(:user_id, 
                                                :key, 
                                                :tempo, 
                                                :genre_input, 
                                                :song_attributes => [:name, :user_id, :id], 
                                                :artist_attributes => [:name, :user_id, :id], 
                                                :arranger_attributes => [:name, :user_id, :id], 
                                                :genre_attributes => [:names, :user_id],
                                                :charts_attributes => [:id, :instrument, :chart_pdf, :_destroy]
            )
        end

        def genre_cleanup
            @user.genres.each do |genre|
                if genre.arrangements.count == 0
                    genre.destroy
                end
            end
        end
end