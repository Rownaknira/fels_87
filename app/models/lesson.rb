class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :activities, dependent: :destroy
  accepts_nested_attributes_for :results
  before_create :create_results
  before_update :update_result

  scope :learned_words, ->(user_id) do
    result_ids = Lesson.joins(:results).select(:word_id).where("lessons.user_id = ? ",user_id)
  end

  private
  def create_results
    unique_word = category.words.order("RANDOM()").limit 20
    unique_word.each do |word|
      self.results.build word_id: word.id
    end
  end
  def update_result
    self.progress = results.select do|result|
    result.answer.try(:correct?)
    end.count
  end
end
