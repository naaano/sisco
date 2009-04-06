class HoboMigration45 < ActiveRecord::Migration
  def self.up
    add_column :revisiones, :created_at, :datetime
    add_column :revisiones, :updated_at, :datetime
  end

  def self.down
    remove_column :revisiones, :created_at
    remove_column :revisiones, :updated_at
  end
end
