class CreateUsers < ActiveRecord::Migration[5.2]
  
# Create a user model with: first_name, last_name and email
# Write a class method, search, to find users whose first_name, last_name or email exactly matches a given string argument, search_term.
  # rails generate model user first_name:string last_name:text email:text
    def change
    create_table :users do |t|
      t.string :first_name
      t.text :last_name
      t.text :email

      t.timestamps
    end
  end
end
