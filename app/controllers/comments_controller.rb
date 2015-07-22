class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    # @article = Article.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      flash.notice = "You left a comment"
      redirect_to article_path(@comment.article.id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
