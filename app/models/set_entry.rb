class SetEntry < ApplicationRecord
    belongs_to :setlist
    belongs_to :arrangement 
    acts_as_list
    scope :sort_by_position, -> {order('position ASC')}
end
