class CreateWeatherPrevisions < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_previsions do |t|
      t.date :date
      t.references :city, null: false, foreign_key: true
      t.references :weather_type, null: false, foreign_key: true
      t.integer :temperature

      t.timestamps
    end
  end
end
