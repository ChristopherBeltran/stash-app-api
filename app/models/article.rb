class Article < ActiveRecord::Base
    belongs_to :source, optional: true
end