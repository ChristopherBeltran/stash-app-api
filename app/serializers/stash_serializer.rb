class StashSerializer
    include FastJsonapi::ObjectSerializer
    #belongs_to :user
    #has_many :articles


  attribute :articles do |stash|
    stash.articles.map do |article|
      {
        id: article.id,
        url: article.url,
        urlToImage: article.url_to_image,
        title: article.title,
        description: article.description,
        content: article.content,
        author: article.author,
        published_at: article.published_at,
        source: article.source
      }
    end
end

end 