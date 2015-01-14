class Article
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :content, type: String
  field :tags, type: String
  field :category, type: String
  field :date, :type => Date
  field :language, type: String
  field :public, type: Mongoid::Boolean

  embeds_many :comments
end
