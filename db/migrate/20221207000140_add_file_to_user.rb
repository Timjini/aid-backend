class AddFileToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :file, :string
  end
end
