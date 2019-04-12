class User < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :reviews, dependent: :nullify

    has_secure_password
    validates(:email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)

    # Write a class method, search, to find users whose first_name, last_name or email exactly matches a given string argument, search_term.
    scope(:search, ->(search_term) { where("first_name LIKE ? OR last_name LIKE ? OR email like ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")})

end
