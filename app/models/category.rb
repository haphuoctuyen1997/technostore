class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :suggests, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :parent_id, presence: true

  scope :newest, ->{order created_at: :desc}

  def parent_name
    return "null" if parent_id == Settings.category_roof
    category = Category.find_by id: parent_id
    category ? category.name : t("category.not_found")
  end
end
