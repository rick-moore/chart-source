class SetEntry < ApplicationRecord
    belongs_to :setlist
    belongs_to :arrangement 
    acts_as_list
end
