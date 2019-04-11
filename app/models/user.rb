class User < ApplicationRecord
    
    # Write a class method, search, to find users whose first_name, last_name or email exactly matches a given string argument, search_term.

    scope(:search, ->(search_term) { where("first_name LIKE ? OR last_name LIKE ? OR email like ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")})

end
