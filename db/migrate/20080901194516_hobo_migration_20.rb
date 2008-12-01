class HoboMigration20 < ActiveRecord::Migration
  def self.up
    rename_column :documentos, :buzon_id, :origen_id
  end

  def self.down
    rename_column :documentos, :origen_id, :buzon_id
  end
end
