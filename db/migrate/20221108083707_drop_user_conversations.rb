class DropUserConversations < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_conversations
  end
end
