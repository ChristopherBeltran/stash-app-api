class StreamSerializer
    include FastJsonapi::ObjectSerializer
    #belongs_to :user
    has_many :sources
    attributes :id
end 