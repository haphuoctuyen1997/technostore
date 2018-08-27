class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :suggests, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max.name}
  validates :parent_id, presence: true
end
