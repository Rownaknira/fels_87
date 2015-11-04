class User < ActiveRecord::Base
  has_many :lessons, through: :activities
  has_many :activities, dependent :destroy
  acts_in_relation role: :self, action: :follow
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  validates :rank,  presence: true, numericality: { greater_than_or_equal_to: 0 }
end
