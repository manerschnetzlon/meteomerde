class ChangeCities < ActiveRecord::Migration[6.1]
  def change
    add_reference :cities, :department, foreign_key: true
  end
end
