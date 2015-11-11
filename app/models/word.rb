class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :category_id,  presence: true
  validates_presence_of :content, :answers
end
