class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "#{@article.title} created"
      redirect_to articles_path(@article.id)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash.notice = "Deleted #{@article.title}"
    redirect_to articles_path
  end

  private

  # def article_params
  #   params.require(:article).permit(:title, :body)
  # end

  def set_article
    @article = Article.find(params[:id])
  end

end
