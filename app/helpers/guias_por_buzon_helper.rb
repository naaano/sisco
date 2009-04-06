module GuiasPorBuzonHelper
## esto filtra las opciones de buzon (a.k.a. copias info) a solo buzones locales 
  def options_for_association_conditions(association)
    if association.name == :buzon
      #c = Buzon.find(:all, :include => [:copia], :conditions => "" )
      ['buzones.id in (select distinct copias.destinatario_id from copias LEFT JOIN buzones on copias.buzon_id = buzones.id WHERE buzones.externo = false and copias.estado_id in (1,6) and copias.buzon_id = ?)', session[:usuario].puesto.buzon_id]
      #['buzones.externo = false']
    else
      super
    end
  end
  
end
