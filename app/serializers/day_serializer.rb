class DaySerializer < ActiveModel::Serializer
  attributes :id, :day, :month, :year
  has_many :progresses
  has_many :habits 
end
