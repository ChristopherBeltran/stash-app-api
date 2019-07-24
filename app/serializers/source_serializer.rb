class SourceSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :description
end