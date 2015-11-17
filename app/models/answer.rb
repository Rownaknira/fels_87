class Answer < ActiveRecord::Base
  belongs_to :word, inverse_of: :answers
  has_many :results
  validates :content,  presence: true
  scope :corrected, -> { where(correct: true).first }
end
