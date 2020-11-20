class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :area
      t.string :pref
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
