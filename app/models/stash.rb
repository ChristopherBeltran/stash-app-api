class Stash < ActiveRecord::Base
    belongs_to :user
    has_many :stash_articles
    has_many :articles, through: :stash_articles
    has_many :sources, through: :articles

end 