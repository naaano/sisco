class HoboMigration17 < ActiveRecord::Migration
  def self.up
    add_column :copias, :recibido_id, :boolean
  end

  def self.down
    remove_column :copias, :recibido_id
  end
end
