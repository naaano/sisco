class AddFinalizadoToDesarrollo < ActiveRecord::Migration
  def self.up
    add_column :desarrollos, :finalizado, :datetime
  end

  def self.down
    remove_column :desarrollos, :finalizado
  end
end
