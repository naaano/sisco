class HoboMigration28 < ActiveRecord::Migration
  def self.up
    add_column :copias, :firmante_id, :integer
  end

  def self.down
    remove_column :copias, :firmante_id
  end
end
