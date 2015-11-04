class Lesson < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :users, through: :activities
  belongs_to :category
end
