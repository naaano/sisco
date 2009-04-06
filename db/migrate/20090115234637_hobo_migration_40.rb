class HoboMigration40 < ActiveRecord::Migration
  def self.up
    rename_column :buzones, :parent_id, :superior_id
  end

  def self.down
    rename_column :buzones, :superior_id, :parent_id
  end
end
