class HoboMigration41 < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :nombre
    end
    
    create_table :desarrollos do |t|
      t.string   :titulo
      t.text     :descripcion
      t.integer  :status_id
      t.integer  :categoria_id
      t.integer  :usuario_id
      t.boolean  :critico
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :categorias do |t|
      t.string :nombre
    end
  end

  def self.down
    drop_table :statuses
    drop_table :desarrollos
    drop_table :categorias
  end
end
