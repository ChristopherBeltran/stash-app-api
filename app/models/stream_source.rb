class StreamSource < ActiveRecord::Base
    belongs_to :stream
    belongs_to :source
end 