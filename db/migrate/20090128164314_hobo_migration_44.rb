class HoboMigration44 < ActiveRecord::Migration
  def self.up
    create_table :revisiones do |t|
      t.string  :observacion, :limit => 2047
      t.integer :puesto_id, :nil => false
      t.integer :documento_id, :nil => false
    end
  end

  def self.down
    drop_table :revisiones
  end
end
