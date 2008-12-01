class HoboMigration13 < ActiveRecord::Migration
  def self.up
    add_column :guias, :buzon_id, :integer
  end

  def self.down
    remove_column :guias, :buzon_id
  end
end
