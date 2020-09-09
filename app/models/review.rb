class Review < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
  validates :score, presence: true
end
