class RecommendationSerializer < ActiveModel::Serializer
  attributes :id, :reasons, :created_at

  has_one :recommended
  has_one :recommending
  has_one :user
end
