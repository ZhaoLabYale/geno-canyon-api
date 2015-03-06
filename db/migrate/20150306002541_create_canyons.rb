class CreateCanyons < ActiveRecord::Migration
  def change
    create_table :canyons do |t|
      t.integer :chrom, limit: 1
      t.integer :loc, limit: 8
      t.decimal :value

      t.timestamps null: false
    end
    add_index :canyons, :chrom
  end
end
