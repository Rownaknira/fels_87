class Category < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :words, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 20 }
end
