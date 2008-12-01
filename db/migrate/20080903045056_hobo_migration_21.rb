class HoboMigration21 < ActiveRecord::Migration
  def self.up
    add_column :copias, :recepcion, :datetime
  end

  def self.down
    remove_column :copias, :recepcion
  end
end
