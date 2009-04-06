class HoboMigration35 < ActiveRecord::Migration
  def self.up
    add_column :documentos, :observaciones, :text
  end

  def self.down
    remove_column :documentos, :observaciones
  end
end
