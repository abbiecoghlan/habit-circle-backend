class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :progresses
  has_many :habits
  has_many :progresses, through: :habits

  # def current_month
  #   object.progresses.select {|p| p.day.month == Time.now.month && p.day.year == Time.now.year}
  # end 
end
