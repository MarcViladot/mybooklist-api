class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :born
  has_many :books
end
