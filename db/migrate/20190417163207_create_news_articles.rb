class CreateNewsArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :description
      t.timestamp :created_at
      t.timestamp :published_at

      t.timestamps
    end
  end
end
