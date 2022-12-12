class AddInfoToBiker < ActiveRecord::Migration[6.1]
  def change
    add_column :bikers, :city_of_origin, :string
    add_column :bikers, :state_of_origin, :string
    add_column :bikers, :latitude, :float
    add_column :bikers, :longitude, :float
    add_column :bikers, :first_name, :string
    add_column :bikers, :last_name, :string
  end
end
