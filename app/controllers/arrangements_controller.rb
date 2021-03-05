class ArrangementsController < ApplicationController
    before_action :set_arrangement, only: %i[ show edit destroy ]
    before_action :set_user, only: %i[ index new ] 

    def index
        if @user == current_user
            @arrangements = @user.owned_arrangements
            render 'arrangements/index'
        else
            redirect_to login_path
        end
    end
    
    def show
        if @arrangement.belongs_to_user(current_user)
            render 'arrangements/show'
        else
            redirect_to user_arrangements_path(current_user)
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
        @user = User.find_by(params[:user_id])
        a = Arrangement.new(arrangement_params)
        a.owner = @user
        a.genres.each do |genre|
            @user.genres << genre
        end
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