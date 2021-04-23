class ProgressSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :completed
  belongs_to :habit
  belongs_to :day

  
  def user_id
    object.habit.user.id
  end 


end
