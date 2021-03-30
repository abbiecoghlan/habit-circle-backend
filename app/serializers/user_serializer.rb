class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :created

  # has_many :habits
  # has_many :progresses, through: :habits

  
  # took progresses out of attributes
    # , :promises 

  def created
    object.created_at.month
  end 
end
