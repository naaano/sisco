class HoboMigration26 < ActiveRecord::Migration
  def self.up
    add_column :copias, :accion_id, :integer
  end

  def self.down
    remove_column :copias, :accion_id
  end
end
