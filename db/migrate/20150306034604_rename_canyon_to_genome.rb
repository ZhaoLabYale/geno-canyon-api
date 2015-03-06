class RenameCanyonToGenome < ActiveRecord::Migration
  def change
    rename_table :canyons, :genomes
  end
end
