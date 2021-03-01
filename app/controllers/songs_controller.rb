class SongsController < ApplicationController
    before_action :set_song, :set_user, only: :show

    def show
        if @song.owner == @user && current_user == @user
            render 'songs/show'
        else
            redirect_to home_path
        end
    end

    private
        def set_song
            @song = Song.find(params[:id])
        end

        def set_user
            @user = User.find(params[:user_id])
        end


end
