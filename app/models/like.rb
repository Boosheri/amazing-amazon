class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :review_id, uniqueness: { scope: :user_id }
  # same 
  # validates :user_id, uniqueness: { scope: :review_id } 
  #review_id and user_id are from the foreign keys on likes table
end
