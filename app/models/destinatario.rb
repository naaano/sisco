class Destinatario < Buzon
  has_many :copias
  
  set_inheritance_column nil
end