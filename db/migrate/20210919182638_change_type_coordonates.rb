class ChangeTypeCoordonates < ActiveRecord::Migration[6.1]
  def change
    change_column :cities, :longitude, :float
    change_column :cities, :latitude, :float
  end
end
