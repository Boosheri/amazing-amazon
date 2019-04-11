class Product < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates(
    :title,
    presence: true, 
    uniqueness: {case_sensitive: false}
    )
    validates(
      :price, 
      numericality: {greater_than: 0,}
      )
      validates(
        :description,
        presence: true,
        length: { minimum: 10 }
        )
        before_validation(:set_default_price)
        before_save(:capitalize_title)
        validate(:no_apple_microsoft_sony)
        
        # Add a custom methods called search to the product model to search for a product with its title or description if it contains a specific word. For instance you should be able to do:
        # Product.search("car")
        # [Challenge]: Show the products that contain the searched word in their title before the ones that contain the searched word only in the description. For instance, if a product contains the word car in its title, it should before a product that only contains the word car only in the description.
        #   def self.search (s)
        #   @results = Product.where
        #   ("title ILIKE ?" OR "description ILIKE ?", "%#{s}%")
        #   .order(title: :desc, description: :desc)
        #   Question.all.order(created_at: :desc)
        # end
        # is equivalent to:
        scope(:search, ->(query) { where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%").order(title: :desc, description: :desc)})
        
        private
        
        def set_default_price
          # If you are writing to an attriibute accessor
          # you must prefix with self., which you don't
          # have to do if you are just reading it.
          self.price ||= 1
        end
        
        def capitalize_title
          # If you are writing to an attriibute accessor
          # you must prefix with self., which you don't
          # have to do if you are just reading it.
          self.title.capitalize!
        end
        
        # Given a product model with name and price:
        # Write a validation that makes sure that the name is present, unique and that it's not any of these reserved words: Apple, Microsoft & Sony.
        # Note: Use the Amazon app.

        def no_apple_microsoft_sony
          # &. is the safe navigation operator. It's used
          # like the . operator to call methods on an object.
          # If the method doesnt exist for the object, 'nil'
          # will be returned instead of getting an error.
          if description&.downcase&.include?("apple")
          elsif description&.downcase&.include?("microsoft")
          elsif description&.downcase&.include?("sony")
            # To make a record invalid, you must add a
            # validation error using the errors `add` method.
            # It's arguments are (in order):
            #  - A symbol for the invalid column
            #  - An error message as a String.
        errors.add(:description, "must not be Apple, Microsoft or Sony")
      end
    end
end
