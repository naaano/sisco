class HoboMigration14 < ActiveRecord::Migration
  def self.up
    add_column :buzones, :externo, :boolean
  end

  def self.down
    remove_column :buzones, :externo
  end
end
