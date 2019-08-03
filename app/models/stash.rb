class Stash < ActiveRecord::Base
    belongs_to :user
    has_many :stash_articles
    has_many :articles, through: :stash_articles
    has_many :sources, through: :articles
    accepts_nested_attributes_for :articles


    def article_attributes=(article_attributes)
        if article_attributes[:url] != ""
            if Article.exists?(url === article_attributes[:url])
                article = Article.find(url: article_attributes[:url])
                self.articles << article
            else
            article = Article.create
            source = Source.find(api_id: article_attributes[:source_api_id])
            article.title = article_attributes[:title]
            article.description = article_attributes[:description]
            article.url = article_attributes[:url]
            article.url_to_image = article_attributes[:url_to_image]
            if article_attributes[:author] != "" || article_attributes[:author] != null
                article.author = article_attributes[:author]
            end 
            article.content = article_attributes[:content]
            article.published_at = article_attributes[:published_at]
            article.source = source
            article.save
            self.articles << article
            end 
        end 
    end 

end 