class AddProgressToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :progress, :integer
  end
end
