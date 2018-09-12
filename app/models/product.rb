class Product < ApplicationRecord
  belongs_to :category
  delegate :name, to: :category, prefix: true

  has_many :comments, dependent: :destroy
  has_many :rattings, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :category_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :price, presence: true, numericality: true
  validates :description, presence: true,
   length: {maximum: Settings.maximum.description}
  validates :quantity, presence: true, numericality: {only_integer: true}

  scope :top_order, ->{order(number_of_order: :desc).limit Settings.top_order}
  scope :newest, ->{order(created_at: :desc).limit Settings.product_recent}
  scope :by_category, ->(category_id){where category_id: category_id if category_id.present?}
  scope :by_name, ->(name){where "name LIKE ?", "%#{name}%" if name.present?}
  scope :by_min_price, ->(min){where "price >= #{min}" if min.present?}
  scope :by_max_price, ->(max){where "price <= #{max}" if max.present?}

  def update_quantity old_quantity
    update_attributes quantity: (quantity - old_quantity)
  end
end
