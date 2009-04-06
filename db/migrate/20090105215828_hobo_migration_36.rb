class HoboMigration36 < ActiveRecord::Migration
  def self.up
    add_column :trazas, :asignado_id, :integer
    Traza.find(:all, :conditions => 'asignado_id is null').each{|ts| 
    ts.asignado_id = ts.copia.puesto_id
    ts.save!
    }
    change_column :correcciones, :descripcion, :string, :limit => 1023
  end

  def self.down
    remove_column :trazas, :asignado_id
    
    change_column :correcciones, :descripcion, :string, :limit => 1023
  end
end
