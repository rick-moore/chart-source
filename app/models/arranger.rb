class Arranger < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :arrangements

    def self.unique_by_name
        order(name: :asc).uniq
    end
end
