class Arranger < ApplicationRecord
    has_many :arrangements
    belongs_to :owner, :class_name => "User"

    def self.unique_by_name
        order(name: :asc).uniq
    end
end
