class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :puestos, :buzon_id, :integer
    add_column :puestos, :usuario_id, :integer
    add_column :puestos, :cargo_id, :integer
    
    remove_column :buzones, :puesto_id
  end

  def self.down
    remove_column :puestos, :buzon_id
    remove_column :puestos, :usuario_id
    remove_column :puestos, :cargo_id
    
    add_column :buzones, :puesto_id, :integer
  end
end
