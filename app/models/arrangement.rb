class Arrangement < ApplicationRecord
    belongs_to :song
    belongs_to :owner, :class_name => "User"
    belongs_to :arranger
    has_many :charts
    has_many :genre_tags
    has_many :genres, through: :genre_tags
    has_many :set_entries
    has_many :setlists, through: :set_entries
end
