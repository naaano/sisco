class Origen < Buzon
  has_many :copias
  set_inheritance_column nil
  
  #para los listados
  def to_label
    self.nombre
  end
  
  #para record_select, los combos dinámicos que puedan ser más contextuales
  def full_label
    "#{self.sigla} - #{self.nombre}"
  end
end