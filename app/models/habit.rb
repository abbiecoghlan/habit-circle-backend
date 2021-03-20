class Habit < ApplicationRecord
    belongs_to :user
    has_many :progresses
    has_many :days, through: :progresses
    validates :name, presence: true
end
