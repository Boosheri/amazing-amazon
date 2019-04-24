# To generate this migration, do:
# rails g model like user:references review:references

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    # This table will act as a join table between
    # users & questions to for a many-to-many relationship.
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
