class HoboMigration42 < ActiveRecord::Migration
  def self.up
    add_column :desarrollos, :prioridad, :integer
  end

  def self.down
    remove_column :desarrollos, :prioridad
  end
end
