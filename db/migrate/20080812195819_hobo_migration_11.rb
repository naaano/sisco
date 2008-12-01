class HoboMigration11 < ActiveRecord::Migration
  def self.up
    add_column :trazas, :usuario_id, :integer
  end

  def self.down
    remove_column :trazas, :usuario_id
  end
end
