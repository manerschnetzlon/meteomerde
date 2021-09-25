class ChangeCities < ActiveRecord::Migration[6.1]
  def change
    remove_column :cities, :department
    add_reference :cities, :department, foreign_key: true
  end
end
