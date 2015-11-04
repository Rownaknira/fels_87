class AddLessonIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :lesson_id, :integer
  end
end
