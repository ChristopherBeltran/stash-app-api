class Stash < ActiveRecord::Base
    belongs_to :user
    has_many :stash_articles
    has_many :articles, through: :stash_articles
    has_many :sources, through: :articles
    accepts_nested_attributes_for :articles


    def article_attributes=(article_attributes)
        if article_attributes[:url] != ""
            article = Article.find_or_create_by(article_attributes)
            self.articles << article
        end 
    end 

end 