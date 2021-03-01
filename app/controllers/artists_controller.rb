class ArtistsController < ApplicationController
    before_action :set_artist, :set_user, only: :show

    # This path should always be nested in a user path
    # You should only be able to view your owned arrangements
    def show
        if @artist.owner == @user && current_user == @user
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