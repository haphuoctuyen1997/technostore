class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save{email.downcase!}
  before_create :create_activation_digest

  has_many :comments, dependent: :destroy
  has_many :rattings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :address, presence: true,
    length: {maximum: Settings.maximum.address}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}
  validates :email, presence: true, length: {maximum: Settings.maximum.email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.minimum.pass},
    allow_nil: true

  has_secure_password

  enum role: {member: 0, admin: 1}

  scope :newest, ->{order created_at: :DESC}
  scope :search, ->(key) do
    where "name LIKE ? OR email LIKE ?", "%#{key}%", "%#{key}%"
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # def authenticated_mail? attribute, _token
  #   send("#{attribute}_digest")
  # end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  class << self
    def digest string
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Password.create string, cost: BCrypt::Engine::MIN_COST
      else
        BCrypt::Password.create string, cost: BCrypt::Engine.cost
      end
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
