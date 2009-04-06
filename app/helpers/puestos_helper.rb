module PuestosHelper
  def options_for_association_conditions(association)
    if association.name == :usuario
      ['usuarios.id not in (select usuario_id from puestos where usuario_id is not null)' ]
    elsif association.name == :buzon
      ['buzones.externo = false']
    else
      super
    end
  end 
end
