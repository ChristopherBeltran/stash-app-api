class SourceSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description, :api_id, :url
    #has_many :articles
end