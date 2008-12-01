module MiembrosHelper
  def options_for_association_conditions(association)
    if association.name == :usuario
      ['usuarios.id not in (select usuario_id from puestos where usuario_id is not null)' ]
    else
      super
    end
  end 
end
