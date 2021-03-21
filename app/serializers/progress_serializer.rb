class ProgressSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :completed
  belongs_to :habit
  belongs_to :day

  
  def user_id
    object.habit.user.id
  end 

  

  # :day_num, :habit_name
  # def day_num
  #   object.day.day
  # end 

  # def habit_name
  #   object.habit.name
  # end 
end
