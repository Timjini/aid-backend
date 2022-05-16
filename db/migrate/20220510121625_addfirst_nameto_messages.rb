class AddfirstNametoMessages < ActiveRecord::Migration[6.1]
  def change
    t.references :first_name
  end
end
