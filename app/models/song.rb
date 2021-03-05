class Song < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :arrangements
    has_many :artists, through: :arrangements
    has_many :charts, through: :arrangements
    has_many :arrangers, through: :arrangements
    has_many :genres, through: :arrangements

    def self.unique_by_title
        order(name: :asc).uniq
    end
end
