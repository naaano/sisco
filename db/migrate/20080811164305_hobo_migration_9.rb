class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :copias, :puesto_id, :integer
  end

  def self.down
    remove_column :copias, :puesto_id
  end
end
