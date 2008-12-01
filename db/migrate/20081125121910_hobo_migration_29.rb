class HoboMigration29 < ActiveRecord::Migration
  def self.up
    remove_column :copias, :firmante_id
  end

  def self.down
    add_column :copias, :firmante_id, :integer
  end
end
