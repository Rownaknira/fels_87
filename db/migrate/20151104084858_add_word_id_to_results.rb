class AddWordIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :word_id, :integer
  end
end
