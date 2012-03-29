class AddEmemoYEntregaToDesarrollo < ActiveRecord::Migration
  def self.up
    add_column :desarrollos, :ememo, :boolean
    add_column :desarrollos, :entrega, :datetime
  end

  def self.down
    remove_column :desarrollos, :entrega
    remove_column :desarrollos, :ememo
  end
end
