class HoboMigration46 < ActiveRecord::Migration
  def self.up
    create_table :novedades do |t|
      t.string   :titulo
      t.text     :texto
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :novedades
  end
end
