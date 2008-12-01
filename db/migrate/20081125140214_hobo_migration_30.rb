class HoboMigration30 < ActiveRecord::Migration
  def self.up
    add_column :clasificaciones, :codigo, :string
  end

  def self.down
    remove_column :clasificaciones, :codigo
  end
end
