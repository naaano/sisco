class Origen < Buzon
  has_many :copias
  set_inheritance_column nil
  
  #para los listados
  def to_label
    self.nombre
  end
  
end