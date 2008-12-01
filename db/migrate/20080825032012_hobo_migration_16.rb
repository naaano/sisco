class HoboMigration16 < ActiveRecord::Migration
  def self.up
    add_column :buzones, :type, :string
    remove_column :buzones, :jerarquia_id
  end

  def self.down
    remove_column :buzones, :type
    add_column :buzones, :jerarquia_id, :integer
  end
end
