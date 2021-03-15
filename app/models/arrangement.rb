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
    accepts_nested_attributes_for :charts, allow_destroy: true
    validates :song_id, presence: true
    validates :arranger_id, presence: true
    before_destroy :assets_cleanup
    
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
        @user = User.find_by(id: genre_attributes[:user_id])
        genre_names = genre_attributes[:names].split(',')
        genre_names.each do |genre_name|
            if g = @user.genres.find_by(name: genre_name)
                self.genres << g unless self.genres.include?(g)
            else 
                g = @user.genres.build(name: genre_name)
                self.genres << g
            end
        end
        genre_tags.each do |genre_tag|
            genre_tag.destroy if !genre_names.include?(genre_tag.genre.name)
        end
    end

    def song_attributes=(song_attributes)
        @user = User.find_by(id: song_attributes[:user_id])
        if !song_attributes[:name].empty?
            if s = @user.songs.find_by(name: song_attributes[:name])
                self.song = s
            else
                s = @user.songs.create(name: song_attributes[:name])
                self.song = s
            end
        else
            self.song = Song.new
        end
    end

    def artist_attributes=(artist_attributes)
        @user = User.find_by(id: artist_attributes[:user_id])
        if !artist_attributes[:name].empty?
            if a = @user.artists.find_by(name: artist_attributes[:name])
                self.artist = a
            else
                a = @user.artists.create(name: artist_attributes[:name])
                self.artist = a
            end
        else
            self.artist = Artist.new
        end
    end

    def arranger_attributes=(arranger_attributes)
        @user = User.find_by(id: arranger_attributes[:user_id])
        if !arranger_attributes[:name].empty?
            if a = @user.arrangers.find_by(name: arranger_attributes[:name])
                self.arranger = a
            else
                a = @user.arrangers.create(name: arranger_attributes[:name])
                self.arranger = a
            end
        else
            self.arranger = Arranger.new
        end
    end

    def assets_cleanup
        self.charts.destroy_all
        self.arranger.destroy if self.arranger.arrangements.count == 1
        self.artist.destroy if self.artist && self.artist.arrangements.count == 1 
        self.song.destroy if self.song.arrangements.count == 1
        self.genres.each do |genre|
            genre.destroy if genre.arrangements.count == 1
        end
    end
end
