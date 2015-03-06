class AddIndexOnLoc < ActiveRecord::Migration
  def change
    add_index :canyons, :loc
  end
end
