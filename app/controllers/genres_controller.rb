class GenresController < ApplicationController
    before_action :verify_logged_in

    def index
        @genres = current_user.genres
    end

    def show
        set_genre
        verify_current_user
        render 'genres/show'
    end

    private
        def verify_current_user
            if @genre.owner != current_user
                redirect_to home_path, alert: "You can only view your own genres"
            end
        end

        def set_genre
            @genre = Genre.find_by(id: params[:id])
        end
end