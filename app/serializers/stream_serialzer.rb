class StreamSerializer
    include FastJsonapi::ObjectSerializer
    belongs_to :user
    has_many :stream_sources
    has_many :sources, through: :stream_sources
end 