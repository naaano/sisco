class Tipo < ActiveRecord::Base
   has_many :documentos, :dependent => :nullify
   
  fields do
    nombre :string, :name => true
    timestamps
  end
  
  def to_s
    nombre
  end
  
  def cantidad_de_documentos
    self.documentos.count
  end

end
