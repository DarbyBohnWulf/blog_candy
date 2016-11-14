class CommentsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
