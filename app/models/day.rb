class Day < ApplicationRecord
    has_many :progresses
    has_many :habits, through: :progresses

end
