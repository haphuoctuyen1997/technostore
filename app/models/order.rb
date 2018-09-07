class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  delegate :name, to: :user, prefix: true

  validates :receiver_name, presence: true,
   length: {maximum: Settings.maximum.name}
  validates :receiver_address, presence: true,
   length: {maximum: Settings.maximum.address}
  validates :receiver_phone, presence: true,
   length: {maximum: Settings.maximum.phone}
  validates :user_id, presence: true
  validates :total_price, presence: true

  enum status: {pending: 0, accept: 1, cancel: 2}

  scope :newest, ->{order created_at: :desc}
end
