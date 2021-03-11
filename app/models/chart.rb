class Chart < ApplicationRecord
    belongs_to :arrangement
    has_one :song, through: :arrangement
    has_one_attached :chart_pdf
    validates :instrument, presence: true
end
