class SongsController < ApplicationController
    before_action :set_song, only: :show

    def index
        @songs = current_user.songs
    end

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
end
