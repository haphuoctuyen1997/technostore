class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :name, to: :user, prefix: true

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :content, presence: true,
   length: {maximum: Settings.maximum.content}

  scope :newest, ->{order created_at: :desc}
  scope :comment_product, ->(id){where(product_id: id)}
end
