class CreateBikers < ActiveRecord::Migration[6.1]
  def change
    create_table :bikers do |t|
      t.string :first_name
      t.string :last_name
      t.string :city_of_origin
      t.string :state_of_origin
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
