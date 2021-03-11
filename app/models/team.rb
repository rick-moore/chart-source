class Team < ApplicationRecord
    belongs_to :leader, :class_name => "User"
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :setlist_shares
    has_many :setlists, through: :setlist_shares
    has_many :arrangements, through: :setlists
    accepts_nested_attributes_for :memberships
    validates :name, presence: true

    def is_member_or_leader?(user)
        members.include?(user) || leader == user
    end

    def is_leader?(user)
        leader == user
    end
end
