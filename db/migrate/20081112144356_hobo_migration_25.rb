class HoboMigration25 < ActiveRecord::Migration
  def self.up
    rename_column :buzones, :clave, :sigla
    
    add_column :documentos, :digital, :boolean, :default => false
    
    remove_column :copias, :original
  end

  def self.down
    rename_column :buzones, :sigla, :clave
    
    remove_column :documentos, :digital
    
    add_column :copias, :original, :boolean
  end
end
