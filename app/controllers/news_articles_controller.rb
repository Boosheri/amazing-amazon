class NewsArticlesController < ApplicationController
  def new
    @news_article = NewsArticle.new
  end
  
  def create
    @news_article = NewsArticle.new news_article_params
    if @news_article.save
      redirect to news_articles_path(@news_article)
    else
      render :new
    end
  end

  def show
  end

  private

  def news_article_params
    params.require(:news_article).permit(
      :title, :description
    )
  end

end
