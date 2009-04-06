class Status < ActiveRecord::Base
  has_many :desarrollos
  
  validates_presence_of :nombre
  
  fields do
   nombre :string
 end
 
 def to_label
   nombre
 end

#MAURICIO: acabo de agregar las 3 líneas siguientes
  def cantidad
    self.desarrollos.count  
  end

end
