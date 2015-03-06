class ChangeValue < ActiveRecord::Migration
  def change
    change_column :canyons, :value, :decimal, precision: 65, scale: 30
  end
end
