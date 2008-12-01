class HoboMigration10 < ActiveRecord::Migration
  def self.up
    add_column :documentos, :externo, :integer
    add_column :documentos, :folio, :integer
  end

  def self.down
    remove_column :documentos, :externo
    remove_column :documentos, :folio
  end
end
