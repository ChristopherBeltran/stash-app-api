class StashSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name
    #belongs_to :user
    has_many :articles
end 