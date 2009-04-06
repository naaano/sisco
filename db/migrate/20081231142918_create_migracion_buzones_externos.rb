class CreateMigracionBuzonesExternos < ActiveRecord::Migration
  def self.up
    create_table :migracion_buzones_externos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :migracion_buzones_externos
  end
end
