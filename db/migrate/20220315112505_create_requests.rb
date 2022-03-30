class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :user_id
      t.string :fulfillment
      t.string :kind

      t.timestamps
    end
  end
end
