class Genre < ApplicationRecord
    has_many :genre_tags
    has_many :genres, through: :genre_tags
    belongs_to :owner, :class_name => "User"
end
