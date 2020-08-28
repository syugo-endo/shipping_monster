class Review < ApplicationRecord
  validates :content, presence: true
  belongs_to :user

  validates :satisfaction_id, numericality: { other_than: 1 } 
end
