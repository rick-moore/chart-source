class SongsController < ApplicationController
    before_action :set_song, only: :show
    before_action :verify_logged_in

    def index
        @songs = current_user.songs
    end

    def show
        verify_current_user
        render 'songs/show'
    end

    private
        def set_song
            @song = Song.find(params[:id])
        end

        def verify_current_user
            if @song.owner != current_user
                redirect_to home_path, alert: "You can only view your own songs"
            end
        end
end
