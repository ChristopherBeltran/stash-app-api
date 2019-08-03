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
            article = Article.create(article_attributes)
            self.articles << article
            end 
        end 
    end 

end 