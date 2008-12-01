class HoboMigration5 < ActiveRecord::Migration
  def self.up
    create_table :movimientos do |t|
      t.string :nombre, :name => true
    end
  end

  def self.down
    drop_table :movimientos
  end
end
