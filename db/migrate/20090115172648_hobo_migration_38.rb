class HoboMigration38 < ActiveRecord::Migration
  def self.up
    add_column :buzones, :parent_id, :integer
    
    remove_column :correcciones, :mensajes
    change_column :correcciones, :descripcion, :string, :limit => 4095
  end

  def self.down
    remove_column :buzones, :parent_id
    
    add_column :correcciones, :mensajes, :string
    change_column :correcciones, :descripcion, :string, :limit => 1023
  end
end
