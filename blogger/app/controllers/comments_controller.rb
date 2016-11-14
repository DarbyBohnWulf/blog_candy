class CommentsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    if @comment.save
      flash.notice = "Your comment was posted!"
      redirect_to article_path(@comment.article)
    else
      flash.notice = "Couldn't create comment."
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
