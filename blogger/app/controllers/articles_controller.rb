class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "#{@article.title} was published."
      redirect_to article_path(@article)
    else
      flash.notice = "#{@article.title} couldn't be saved."
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.save
      flash.notice = "You updated '#{@article.title}'."
      redirect_to @article
    else
      flash.notice = "There was a problem updating '#{@article.title}'."
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash.notice = "#{@article.title} was deleted."
      redirect_to articles_path
    else
      flash.notice = "#{@article.title} stayed in the db."
    end
  end

  protected
    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end
end
