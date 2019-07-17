class Api::V1::SourcesController < ApplicationController

    def index
        @sources = Source.all
        render json: SourceSerializer.new(@sources), status: :ok
    end 

end 
