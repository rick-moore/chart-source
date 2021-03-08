module UsersHelper
    def display_name(user, team)
        Membership.find_by(user_id: user.id, team_id: team.id).display_name
    end
end
