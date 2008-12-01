class HoboMigration22 < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.integer  :usuario_id
      t.integer  :correccion_id
      t.string   :texto, :length => 4095
      t.datetime :created_at
    end
    
    create_table :correcciones do |t|
      t.string   :descripcion, :length => 4095
      t.string   :mensajes, :length => 4095
      t.boolean  :corregido, :default => false
      t.boolean  :critico, :default => false
      t.integer  :usuario_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_column :documentos, :parent_id, :integer
  end

  def self.down
    remove_column :documentos, :parent_id
    
    drop_table :comentarios
    drop_table :correcciones
  end
end
