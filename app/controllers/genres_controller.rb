class GenresController < ApplicationController
    def index
        @genres = current_user.genres
    end

    def show
        @genre = Genre.find_by(id: params[:id])
        redirect_to home_path if current_user != @genre.owner
        @arrangements = @genre.arrangements
        render 'genres/show'
    end
end