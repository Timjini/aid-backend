class AddFirstnameToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :firstname, :string
  end
end
