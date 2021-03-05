class SongsController < ApplicationController
    before_action :set_song, only: :show

    def show
        if @song.owner == current_user
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
