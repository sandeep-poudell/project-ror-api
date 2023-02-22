class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]


  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    return if @article.save

    render json: @article.errors, status: :unprocessable_entity
  end

  def update
    return if @article.update(article_params)

    render json: @article.errors, status: :unprocessable_entity
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { "error": "article not found!" }, status: :not_found
  end

  def article_params
    params.require(:article).permit(:title, :content, :status)
  end

end
