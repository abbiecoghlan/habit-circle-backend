class User < ApplicationRecord
    has_many :habits
    has_many :progresses, through: :habits
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password, length: { in: 6..15 }

    has_secure_password
end
