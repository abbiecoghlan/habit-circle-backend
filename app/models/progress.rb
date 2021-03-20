class Progress < ApplicationRecord
    belongs_to :habit
    belongs_to :day
end