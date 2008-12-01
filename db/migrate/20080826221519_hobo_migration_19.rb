class HoboMigration19 < ActiveRecord::Migration
  def self.up
    remove_column :copias, :recibido
  end

  def self.down
    add_column :copias, :recibido, :boolean, :default => false
  end
end
