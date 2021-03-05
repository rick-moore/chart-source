class ArtistsController < ApplicationController
    before_action :set_artist, only: :show

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

        def set_user
            @user = User.find(params[:user_id])
        end
end