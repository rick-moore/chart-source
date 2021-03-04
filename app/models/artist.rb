class Artist < ApplicationRecord
    has_many :songs
    belongs_to :owner, :class_name => "User"

    def self.unique_by_name
        order(name: :asc).uniq
    end
end
