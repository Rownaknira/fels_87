class User < ActiveRecord::Base
  has_many :categories, through: :lessons
  has_many :lessons, dependent: :destroy
  has_many :results, dependent: :destroy
  acts_in_relation role: :self, action: :follow
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
