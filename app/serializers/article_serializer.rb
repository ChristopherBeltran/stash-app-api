class ArticleSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :category, :url, :content
end 