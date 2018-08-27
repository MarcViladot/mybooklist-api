class AddedSerializer < ActiveModel::Serializer
  attributes :id, :progress, :score, :status, :updated_at

  has_one :book
end
