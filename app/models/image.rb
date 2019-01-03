class Image < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :post, optional: true
  belongs_to :product, optional: true
end
