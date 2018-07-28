class AddedSerializer < ActiveModel::Serializer
  attributes :id, :progress, :score, :status

  has_one :book
end
