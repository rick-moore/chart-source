class ArtistsController < ApplicationController
    before_action :set_artist, only: :show
    before_action :verify_logged_in

    def index
        @artists = current_user.artists
    end
    
    def show
        verify_current_user
        @songs = @artist.songs
        render 'artists/show'
    end

    private
        def set_artist
            @artist = Artist.find(params[:id])
        end

        def verify_current_user
            if @artist.owner != current_user
                redirect_to home_path, alert: "You can only view your own artists"
            end
        end
end