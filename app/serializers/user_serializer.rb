class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :created

  def created
    object.created_at.month
  end 

  
end
