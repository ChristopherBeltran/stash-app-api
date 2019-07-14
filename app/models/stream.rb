class Stream < ActiveRecord::Base
    belongs_to :user
    has_many :stream_sources
    has_many :sources, through: :stream_sources

end 