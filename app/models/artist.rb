class Artist < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :arrangements
    has_many :songs, through: :arrangements
end
