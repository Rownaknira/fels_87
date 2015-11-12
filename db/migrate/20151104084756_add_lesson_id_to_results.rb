class AddLessonIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :lesson_id, :integer
  end
end
