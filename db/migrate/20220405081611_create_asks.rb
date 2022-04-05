class CreateAsks < ActiveRecord::Migration[6.1]
  def change
    create_table :asks do |t|
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true , type: :uuid
      t.string :fulfillment
      t.string :kind

      t.timestamps
    end
  end
end
