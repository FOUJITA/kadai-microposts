class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :relationshiplikes, dependent: :destroy
  has_many :likes, through: :relationshiplikes, source: :micropost, dependent: :destroy
  
end