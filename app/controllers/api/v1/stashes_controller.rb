class Api::V1::StashesController < ApplicationController
    before_action :set_stream, only: [:update, :destroy]

    def show
        if logged_in?
            @stash = current_user.stash
            render json: StashSerializer.new(@stash), status: :ok
        else
            render json: {
            notice: "Must be logged in to view stashes"
            }
        end
    end 
    
    def create
        @stash = Stash.new(stash_params)

        if @stash.save
            render json: StashSerializer.new(@stash), status: :ok
        else 
            render json: @stash.errors, status: :unprocessable_entity
        end 
    end
    
    def update
        if @stash.update(stash_params)
          render json: StashSerializer.new(@stash), status: :ok
        else
          render json: stash.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @stash.destroy
      end
    
      private
        def set stash
          @stash = Stash.find(params[:id])
        end
    
        def stash_params
          params.require(:stash).permit(:user_id, article_ids: [], article_attributes: [:title, :category, :url, :content, :source_id])
        end
        
end