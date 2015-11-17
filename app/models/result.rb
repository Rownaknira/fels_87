class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  belongs_to :user

  scope :answer_not_nil, ->{where "answer_id <> ''"}
  scope :total_learned_words, -> (lesson_id) do
    ans_ids = Result.joins(:answer).select(:answer_id).where("correct= ? and answers.word_id = results.word_id and results.lesson_id= ? ",true,lesson_id)
  end
end
