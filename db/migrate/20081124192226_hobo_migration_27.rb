class HoboMigration27 < ActiveRecord::Migration
  def self.up
    add_column :documentos, :origen_sigla, :string
    add_column :documentos, :destinatario_sigla, :string
    add_column :documentos, :buzon_id, :integer
  end

  def self.down
    remove_column :documentos, :origen_sigla
    remove_column :documentos, :destinatario_sigla
    remove_column :documentos, :buzon_id
  end
end
