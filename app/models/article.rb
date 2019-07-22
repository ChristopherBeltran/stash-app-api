class Article < ActiveRecord::Base
    belongs_to :source, optional: true
    has_many :stash_articles
    has_many :stashes, through: :stash_articles
end