class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  mount_uploader :image, ImageUploader
end
