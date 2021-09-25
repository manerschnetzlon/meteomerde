class CreateTemperatureRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :temperature_records do |t|
      t.integer :month
      t.integer :temp_min
      t.integer :temp_max
      t.integer :temp_average
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
