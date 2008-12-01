class HoboMigration31 < ActiveRecord::Migration
  def self.up
    add_column :trazas, :buzon_id, :integer
  end

  def self.down
    remove_column :trazas, :buzon_id
  end
end
