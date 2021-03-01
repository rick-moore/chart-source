class Arranger < ApplicationRecord
    has_many :arrangements
    belongs_to :owner, :class_name => "User"
end
