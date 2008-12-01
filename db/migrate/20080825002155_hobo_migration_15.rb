class HoboMigration15 < ActiveRecord::Migration
  def self.up
    add_column :copias, :origen_id, :integer
    add_column :copias, :destinatario_id, :integer
  end

  def self.down
    remove_column :copias, :origen_id
    remove_column :copias, :destinatario_id
  end
end
