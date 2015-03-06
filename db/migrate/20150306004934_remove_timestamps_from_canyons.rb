class RemoveTimestampsFromCanyons < ActiveRecord::Migration
  def change
    remove_column :canyons, :created_at, :datetime
    remove_column :canyons, :updated_at, :datetime
  end
end
