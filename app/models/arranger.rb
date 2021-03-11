class Arranger < ApplicationRecord
    belongs_to :owner, :class_name => "User"
    has_many :arrangements
end
