class Relationshiplike < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  
  # has_many :relationshiplikes, dependent: :destroy
  # has_many :likes, through: :relationshiplikes, source: :user
end
