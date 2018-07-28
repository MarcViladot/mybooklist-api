class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :plot, :lang, :pages, :form, :cover
  has_many :authors
  has_many :genres
  has_one :serie
end
