class AddActivityIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :activity_id, :integer
  end
end
