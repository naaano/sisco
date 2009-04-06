class HoboMigration43 < ActiveRecord::Migration
  def self.up
    add_column :desarrollos, :hh, :integer
  end

  def self.down
    remove_column :desarrollos, :hh
  end
end
