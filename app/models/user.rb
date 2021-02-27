class User < ApplicationRecord
    has_secure_password
    has_many :created_setlists, :class_name => "Setlist", :foreign_key => :creator_id
    has_many :memberships
    has_many :teams, through: :memberships
    has_many :accessible_setlists, through: :teams, :source => :setlist
    has_many :led_teams, :class_name => "Team", :foreign_key => :leader_id
    has_many :owned_arrangements, :class_name => "Arrangement", :foreign_key => "owner_id"

    def self.find_by_username_or_email(params)
        User.find_by(username: params) || User.find_by(email: params)
    end
end
