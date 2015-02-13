class Article
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :content, type: String
  field :tags, type: Array, default: ["user"]
  field :category, type: String
  field :date, :type => DateTime
  field :language, type: String
  field :public, type: Mongoid::Boolean

  embeds_many :comments


  def tags_as_string
    tags.join(',')
  end

  def tags_as_string=(string)
    update_attributes(tags: string.split(','))
  end
end
