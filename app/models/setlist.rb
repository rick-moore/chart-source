class Setlist < ApplicationRecord
    belongs_to :creator, :class_name => "User"
    belongs_to :team, :optional => true
    has_many :set_entries
    has_many :arrangements, through: :set_entries
end
