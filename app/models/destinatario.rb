class Destinatario < Buzon
  has_many :copias  
  has_many :documentos, :through => :copias
  set_inheritance_column nil
  
  alias_method :cantidad, :copias
  
  def authorized_for_create?
    return false
  end

end