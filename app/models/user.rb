class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :comments, dependent: :destroy
  has_many :rattings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max.name}
  validates :address, presence: true, length: {maximum: Settings.max.address}
  validates :phone, presence: true, length: {maximum: Settings.max.phone}
  validates :email, presence: true, length: {maximum: Settings.max.email},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.min.pass},
   allow_nil: true
  has_secure_password

  before_save{email.downcase!}
  enum role: {member: 0, admin: 1}
end
