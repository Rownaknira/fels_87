class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :words, through: :results

  accepts_nested_attributes_for :results
  before_create: create_results
  before_update :update_result
  validates :progress,  presence: true, numericality: { greater_than_or_equal_to: 0 }

  private
  def create_results
    @unique_word = lesson.category.words.order("RAND()").limit 20
    @unique_word.each do |word|
      lesson.results.build word_id: word.id
    end
  end
  def update_result
    self.result = results.select do|result|
    result.answer.try(:correct?)
    end
  end
end
