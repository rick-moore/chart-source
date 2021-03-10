class ArtistsController < ApplicationController
    before_action :set_artist, only: :show

    def index
        @artists = current_user.artists
    end
    
    def show
        if @artist.owner ==  current_user
            @songs = @artist.songs
            render 'artists/show'
        else
            redirect_to home_path
        end
    end

    private
        def set_artist
            @artist = Artist.find(params[:id])
        end
end