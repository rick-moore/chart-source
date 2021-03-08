class Arrangement < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    belongs_to :song
    belongs_to :arranger
    belongs_to :artist
    has_many :charts
    has_many :genre_tags
    has_many :genres, through: :genre_tags
    has_many :set_entries
    has_many :setlists, through: :set_entries
    scope :sort_by_song_title, -> {includes(:song).order('songs.name ASC')}
    
    def belongs_to_user(user) 
        owner == user 
    end

    def has_team_access(user)
        access = false
        user.teams.each do |team|
            access = true if team.arrangements.include?(self)
        end
        access
    end

    def genre_attributes=(genre_attributes)
        @user = User.find(genre_attributes[:user_id])
        genre_attributes[:names].split(',').each do |genre_name|
            if g = @user.genres.find_by(name: genre_name)
                self.genres << g unless self.genres.include?(g)
            else 
                g = @user.genres.create(name: genre_name)
                self.genres << g
            end
        end
    end

    def song_attributes=(song_attributes)
        @user = User.find(song_attributes[:user_id])
        if s = @user.songs.find_by(name: song_attributes[:name])
            self.song = s
        else
            s = @user.songs.create(name: song_attributes[:name])
            self.song = s
        end
    end

    def artist_attributes=(artist_attributes)
        @user = User.find(artist_attributes[:user_id])
        if a = @user.artists.find_by(name: artist_attributes[:name])
            self.artist = a
        else
            a = @user.artists.create(name: artist_attributes[:name])
            self.artist = a
        end
    end

    def arranger_attributes=(arranger_attributes)
        @user = User.find(arranger_attributes[:user_id])
        if a = @user.arrangers.find_by(name: arranger_attributes[:name])
            self.arranger = a
        else
            a = @user.arrangers.create(name: arranger_attributes[:name])
            self.arranger = a
        end
    end
end
