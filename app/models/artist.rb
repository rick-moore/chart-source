class Artist < ApplicationRecord
    has_many :songs
    belongs_to :owner, :class_name => "User"
end
