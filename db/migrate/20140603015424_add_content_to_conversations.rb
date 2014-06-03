class AddContentToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :content, :text
  end
end
