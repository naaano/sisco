class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :puestos, :opartes, :boolean, :default => false
  end

  def self.down
    remove_column :puestos, :opartes
  end
end
