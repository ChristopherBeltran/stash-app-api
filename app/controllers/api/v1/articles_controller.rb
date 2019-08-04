class Api::V1::ArticlesController < ApplicationController

def show
    if logged_in?
        @article = Article.find(params[:id])
        render json: ArticleSerializer.new(@article), status: :ok
    else
        render json: {
            error: 'Must be logged in to view articles'
        }
    end 
end 


def create
    @article = Article.new(article_params)

    if @article.save
      render json: ArticleSerializer.new(@article), status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      render json: ArticleSerializer.new(@article), status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :url, :content, :url_to_image, :description, :published_at, :author, :source_id)
    end
end 
