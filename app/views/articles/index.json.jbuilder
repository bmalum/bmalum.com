json.array!(@articles) do |article|
  json.extract! article, :id, :name, :content, :tags, :category, :date, :language, :public
  json.url article_url(article, format: :json)
end
