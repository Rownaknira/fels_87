class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  belongs_to :user

  scope :answer_not_nil, ->{where "answer_id <> ''"}
end
