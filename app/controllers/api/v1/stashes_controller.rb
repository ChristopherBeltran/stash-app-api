class Api::V1::StashesController < ApplicationController
    before_action :set_stash, only: [:update, :destroy, :remove_article]
    before_action :set_user, only: [:update]

    def get_stash
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
        @stash = current_user.build_stash(stash_params)

        if @stash.save
            render json: StashSerializer.new(@stash), status: :created
        else 
            render json: @stash.errors, status: :unprocessable_entity
        end 
    end
    
    def update
        if @stash.update(stash_params)
          #options = {}
          #options = { include: [:articles], fields: { article: [:title, :url] } }
          #options[:include] = [@stash.articles, :'articles.title', :'articles.url', :'articles.url_to_image', :'articles.author', :'articles.content', :'articles.description', :'articles.published_at', :'articles.sources']
          render json: StashSerializer.new(@stash), status: :ok
        else
          render json: @stash.errors, status: :unprocessable_entity
        end
      end

      def remove_article
        article = Article.find(params[:article_id])
        @stash.articles.delete(article)
        render json: StashSerializer.new(@stash), status: :ok
      end

      def destroy
        @stash.destroy
      end
    
      private
        def set_stash
          @stash = Stash.find(params[:id])
        end

        def set_user
          @user = User.find(params[:stash][:user_id])
        end
    
        def stash_params
          params.require(:stash).permit(:user_id, :article_id, article_attributes: [:title, :description, :url, :url_to_image, :author, :content, :source_api_id, :published_at])
        end
        
end