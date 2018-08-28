class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user_id, presence: true
  validates :total_price, presence: true
  validates :date_order, presence: true

  enum status: {pending: 0, accept: 1, cancel: 2}
end
