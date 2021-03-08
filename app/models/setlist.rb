class Setlist < ApplicationRecord
    belongs_to :creator, :class_name => "User"
    has_many :set_entries
    has_many :arrangements, through: :set_entries
    has_many :setlist_shares
    has_many :teams, through: :setlist_shares
end
