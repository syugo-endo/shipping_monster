class Review < ApplicationRecord
  validates :text, presence: true
  belongs_to :user

  validates :genre_id, numericality: { other_than: 1 } 
end
