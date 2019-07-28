class SourceSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description, :api_id
end