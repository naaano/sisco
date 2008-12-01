class HoboMigration4 < ActiveRecord::Migration
  def self.up
    create_table :trazas do |t|
      t.integer  :copia_id
      t.integer  :movimiento_id
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :trazas
  end
end
