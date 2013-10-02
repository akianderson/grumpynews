class AddBaseUrlToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :base_url, :string
  end
end
