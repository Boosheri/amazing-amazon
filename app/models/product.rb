class Product < ApplicationRecord

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

      def search (s)
        results = Product.where("title ILIKE ?" || "description ILIKE ?", "%#{s}%")
        (order_by title, description)??
      end

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
end
