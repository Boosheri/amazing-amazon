require 'rails_helper'

RSpec.describe NewsArticle, type: :model do
  
  def news_article
    @news_article ||= NewsArticle.new(
      title: "Awesome Article",
      description: "Some valid description"
    )
  end
  


end
