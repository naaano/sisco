class MuestraNovedades < ActiveRecord::Migration
  def self.up
	add_column :novedades, :muestra, :boolean, :default => false
  end

  def self.down
	remove_column :novedades, :muestra
  end
end
