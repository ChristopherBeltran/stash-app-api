class StashSerializer
    include FastJsonapi::ObjectSerializer
    #belongs_to :user
    has_many :articles
end 