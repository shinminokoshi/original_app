class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.text :business_hours
      t.string :tel
      t.string :pref
      t.float :latitude
      t.float :longitude
      t.string :shop_image1

      t.timestamps
    end
  end
end
