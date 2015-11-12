class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results
  validates :content,  presence: true

  scope :corrected, -> { where(correct: true).first }
end
