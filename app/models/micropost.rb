class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  mount_uploader :picture, PictureUploader
  #validate  :picture_size
  has_many :relationshiplikes, dependent: :destroy
  has_many :likes, through: :relationshiplikes, source: :micropost, dependent: :destroy
  
  has_many :replies
  
  # アップロードされた画像のサイズをバリデーションする
   # def picture_size
    #  if picture.size > 5.megabytes
     #   errors.add(:picture, "should be less than 5MB")
      #end
    #end
  
  
end