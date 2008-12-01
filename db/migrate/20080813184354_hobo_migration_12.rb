class HoboMigration12 < ActiveRecord::Migration
  def self.up
    remove_column :documentos, :digital
    
    add_column :copias, :original, :boolean
    remove_column :copias, :copia
  end

  def self.down
    add_column :documentos, :digital, :integer
    
    remove_column :copias, :original
    add_column :copias, :copia, :integer
  end
end
