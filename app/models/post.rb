class Post < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
end
