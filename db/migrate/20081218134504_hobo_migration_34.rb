class HoboMigration34 < ActiveRecord::Migration
  def self.up
    drop_table :correccions
    
    add_column :buzones, :opartes, :boolean
    
    add_column :documentos, :fecha, :datetime
    add_column :documentos, :anexo, :boolean, :default => false
    add_column :documentos, :sobre, :boolean, :default => false
    add_column :documentos, :paquete, :boolean, :default => false
  end

  def self.down
    remove_column :buzones, :opartes
    
    remove_column :documentos, :fecha
    remove_column :documentos, :anexo
    remove_column :documentos, :sobre
    remove_column :documentos, :paquete
    
    create_table "correccions", :force => true do |t|
      t.string   "descripcion"
      t.string   "mensajes"
      t.boolean  "corregido",   :default => false
      t.boolean  "critico",     :default => false
      t.integer  "usuario_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
