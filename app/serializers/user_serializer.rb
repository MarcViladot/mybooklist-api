class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :email

  has_many :authors
  has_many :books
end
