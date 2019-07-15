class Stream < ActiveRecord::Base
    belongs_to :user
    has_many :stream_sources
    has_many :sources, through: :stream_sources
    accepts_nested_attributes_for :sources



    def source_attributes=(source_attributes)
        if source_attributes[:name] != ""
            source = Source.find_or_create_by(source_attributes)
            self.sources << source
        end 
    end 

end 