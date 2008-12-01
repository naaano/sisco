class HoboMigration2 < ActiveRecord::Migration
  def self.up
    rename_column :buzones, :usuario_id, :puesto_id
  end

  def self.down
    rename_column :buzones, :puesto_id, :usuario_id
  end
end
