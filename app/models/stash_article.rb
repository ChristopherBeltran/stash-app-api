class StashArticle < ActiveRecord::Base
    belongs_to :stash
    belongs_to :article
end 