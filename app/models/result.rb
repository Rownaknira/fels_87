class Result < ActiveRecord::Base
  belongs_to :activity
  belongs_to :word
  belongs_to :answer
end
