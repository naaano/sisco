class HoboMigration6 < ActiveRecord::Migration
  def self.up
    rename_column :usuarios, :name, :nombre
  end

  def self.down
    rename_column :usuarios, :nombre, :name
  end
end
