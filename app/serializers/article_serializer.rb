class ArticleSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :url, :content, :url_to_image, :description, :author
    belongs_to :source
end 