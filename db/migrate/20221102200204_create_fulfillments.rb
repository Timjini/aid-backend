class CreateFulfillments < ActiveRecord::Migration[6.1]
  def change
    create_table :fulfillments do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
