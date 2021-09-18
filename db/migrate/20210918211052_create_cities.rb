class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :longitude
      t.integer :latitude
      t.string :country
      t.string :region
      t.string :department

      t.timestamps
    end
  end
end
