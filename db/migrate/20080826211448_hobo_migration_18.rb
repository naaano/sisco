class HoboMigration18 < ActiveRecord::Migration
  def self.up
    add_column :copias, :recibido, :boolean
  end

  def self.down
    remove_column :copias, :recibido
  end
end
