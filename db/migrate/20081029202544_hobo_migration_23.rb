class HoboMigration23 < ActiveRecord::Migration
  def self.up
    create_table :correccions do |t|
      t.string   :descripcion, :length => 4095
      t.string   :mensajes, :length => 4095
      t.boolean  :corregido, :default => false
      t.boolean  :critico, :default => false
      t.integer  :usuario_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_column :documentos, :pfe, :integer
    add_column :documentos, :pfe_ok, :boolean, :default => false
    add_column :documentos, :nombre, :string
    add_column :documentos, :cuerpo, :text
    add_column :documentos, :xml, :text
  end

  def self.down
    remove_column :documentos, :pfe
    remove_column :documentos, :pfe_ok
    remove_column :documentos, :nombre
    remove_column :documentos, :cuerpo
    remove_column :documentos, :xml
    
    drop_table :correccions
  end
end
