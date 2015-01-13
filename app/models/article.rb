class Article
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :tags, type: String
  field :category, type: String
  field :date, type: DateTime
  field :language, type: String
  field :public, type: Mongoid::Boolean
end
