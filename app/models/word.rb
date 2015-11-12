class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :lessons, through: :results

  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :category_id,  presence: true
  validates_presence_of :content, :answers

  sub_query_learned_by = "id IN (select DISTINCT word_id from results as rs, lessons as ls 
                          where ls.id=rs.lesson_id and ls.user_id = ? and ls.category_id = ? and rs.answer_id = ?)"

  scope :learned, -> (user_id,category_id){where sub_query_learned_by, user_id,category_id,"IS NOT NULL"}
  scope :not_learn, -> (user_id,category_id){where sub_query_learned_by, user_id,category_id,"IS NULL"}
end
