class Chart < ApplicationRecord
    belongs_to :arrangement
    has_one :song, through: :arrangement
end
