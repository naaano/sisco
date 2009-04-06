class HoboMigration33 < ActiveRecord::Migration
  def self.up
    change_column :usuarios, :dominio, :string, :limit => 255, :default => "minrel.gov.cl"
    change_column :usuarios, :admin, :boolean, :default => false
    
    rename_column :documentos, :folio, :folio_interno
    rename_column :documentos, :externo, :folio_externo
    add_column :documentos, :folio_opartes, :integer
    
    add_column :copias, :original, :boolean, :default => false
  end

  def self.down
    change_column :usuarios, :dominio, :string
    change_column :usuarios, :admin, :boolean
    
    rename_column :documentos, :folio_interno, :folio
    rename_column :documentos, :folio_externo, :externo
    remove_column :documentos, :folio_opartes
    
    remove_column :copias, :original
  end
end
