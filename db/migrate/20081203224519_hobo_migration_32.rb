class HoboMigration32 < ActiveRecord::Migration
  def self.up
    add_column :puestos, :ingreso_papel, :boolean, :default => false
  end

  def self.down
    remove_column :puestos, :ingreso_papel
  end
end
