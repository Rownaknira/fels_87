class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_one :result, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  
  validates_presence_of :content, :category_id

  sub_query_learned_by = "select DISTINCT word_id from results as rs, lessons as ls where ls.id=rs.lesson_id 
                          and ls.user_id = ? and rs.answer_id <> ''"

  scope :learned, -> (user_id,category_id) do
    where sub_query_learned_by
    if category_id.blank?
      Word.where "id IN (#{sub_query_learned_by})",user_id
    else
      Word.where "id IN (#{sub_query_learned_by}) AND category_id = ?", user_id,category_id
    end
  end

  scope :not_learn, -> (user_id,category_id) do
    where sub_query_learned_by
    if category_id.blank?
      Word.where "id NOT IN (#{sub_query_learned_by})",user_id
    else
      Word.where "id NOT IN (#{sub_query_learned_by}) AND category_id = ?",user_id,category_id
    end
  end
end
