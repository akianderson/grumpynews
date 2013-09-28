class AddClassificationToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :classification, :string
  end
end
