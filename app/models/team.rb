class Team < ApplicationRecord
    belongs_to :leader, :class_name => "User"
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :setlists
    has_many :arrangements, through: :setlists
end
