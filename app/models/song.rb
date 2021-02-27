class Song < ApplicationRecord
    belongs_to :artist
    has_many :arrangements
    has_many :charts, through: :arrangements
    has_many :arrangers, through: :arrangements
    has_many :genres, through: :arrangements
end
