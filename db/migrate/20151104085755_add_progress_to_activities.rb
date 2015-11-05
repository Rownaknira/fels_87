class AddProgressToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :progress, :integer
  end
end
