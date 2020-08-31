class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :satisfaction
  
  belongs_to :user
  validates :content, presence: true
  validates :satisfaction_id, numericality: { other_than: 1 } 
end
