class HoboMigration24 < ActiveRecord::Migration
  def self.up
    add_column :puestos, :firmante, :boolean, :default => false
    add_column :puestos, :editor, :boolean, :default => false
    
    rename_column :documentos, :titulo, :materia
    add_column :documentos, :origen_puesto_id, :integer
    add_column :documentos, :origen_texto, :string
    add_column :documentos, :origen_puesto_texto, :string
    add_column :documentos, :origen_persona_texto, :string
    add_column :documentos, :destinatario_id, :integer
    add_column :documentos, :destinatario_puesto_id, :integer
    add_column :documentos, :destinatario_texto, :string
    add_column :documentos, :destinatario_puesto_texto, :string
    add_column :documentos, :destinatario_persona_texto, :string
    add_column :documentos, :folio_texto, :string
    add_column :documentos, :lock, :boolean, :default => false
    add_column :documentos, :firma, :boolean, :default => false
    add_column :documentos, :referencia, :string
    remove_column :documentos, :nombre
    
    change_column :notas, :texto, :text, :limit => nil
  end

  def self.down
    remove_column :puestos, :firmante
    remove_column :puestos, :editor
    
    rename_column :documentos, :materia, :titulo
    remove_column :documentos, :origen_puesto_id
    remove_column :documentos, :origen_texto
    remove_column :documentos, :origen_puesto_texto
    remove_column :documentos, :origen_persona_texto
    remove_column :documentos, :destinatario_id
    remove_column :documentos, :destinatario_puesto_id
    remove_column :documentos, :destinatario_texto
    remove_column :documentos, :destinatario_puesto_texto
    remove_column :documentos, :destinatario_persona_texto
    remove_column :documentos, :folio_texto
    remove_column :documentos, :lock
    remove_column :documentos, :firma
    remove_column :documentos, :referencia
    add_column :documentos, :nombre, :string
    
    change_column :notas, :texto, :string
  end
end
