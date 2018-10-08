class Image < ApplicationRecord
  belongs_to :product
  belongs_to :post
  mount_uploader :image, PictureUploader
  # mount_uploader :picture, PictureUploader
end
