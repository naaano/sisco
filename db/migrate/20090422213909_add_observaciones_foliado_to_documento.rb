class AddObservacionesFoliadoToDocumento < ActiveRecord::Migration
  def self.up
    add_column :documentos, :observaciones_foliado, :text
  end

  def self.down
    remove_column :documentos, :observaciones_foliado
  end
end
