class Suggest < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.max.name}
  validates :description, presence: true,
   length: {maximum: Settings.max.description}

  enum status: {pending: 0, accept: 1, cancel: 2}
end
