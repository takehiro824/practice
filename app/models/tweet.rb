class Tweet < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy


  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
