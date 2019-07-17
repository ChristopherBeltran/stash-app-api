class Api::V1::StashesController < ApplicationController
    before_action :set_stream, only: [:update, :destroy]

    def index
        if logged_in?
           @stashes = current_user.stashes
           render json: StashSerializer.new(@stashes), status: :ok
        else 
            render json: {
                error: 'Must be signed in to view stashes'
            }
        end 
    end
    
    def show
        if logged_in?
            @stash = Stash.find(params[:id])
            render :json StashSerializer.new(@stash), status: :ok
        else
            render :json {
            'Must be logged in to view stashes'
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
          params.require (:stash).permit(:name, :user_id)
        end
        
end
