class Movimiento < ActiveRecord::Base
  has_many :trazas
  
  fields do
    nombre :string, :name => true
  end
  
  def to_label
    nombre
  end
  
  def cantidad_de_trazas
    return self.trazas.count
  end
  
  def authorized_for_destroy? 
    return false
  end
end
