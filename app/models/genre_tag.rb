class GenreTag < ApplicationRecord
    belongs_to :genre
    belongs_to :arrangement
end
