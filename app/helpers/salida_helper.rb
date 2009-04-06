module SalidaHelper

## esto filtra las opciones de destinatarios (a.k.a. copias info) a solo buzones locales 
  def options_for_association_conditions(association)
    if association.name == :destinatario
      ['buzones.externo = false']
    elsif association.name == :usuario
       "id in (#{session[:usuario].puesto.buzon.puestos.collect{|p| p.usuario_id}.compact.join(',')})"
    else
      super
    end
  end
  
end
