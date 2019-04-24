class AddUserReferencesToNewsArticles < ActiveRecord::Migration[5.2]
  def change
  # This file was generated with the command
  # > rails g migration add_user_references_to_news_articles user:references
    add_reference :news_articles, :user, foreign_key: true
  end
end
