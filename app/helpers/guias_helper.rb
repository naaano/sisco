module GuiasHelper
  def buzon_actual
    session[:usuario].puesto.buzon_id
  end
=begin  
  def copias_column(record)
    Copia.find(:all, :conditions => ["buzon_id = ? AND estado_id in (1,6 )", session[:usuario].puesto.buzon_id])
  end
=end 

  def clase_muestra_preguia(guia)
     return guia.id.nil? ? "grande" : "invisible"
  end

  def encabezados(usuario)
    th = %w(Id Docto Folio Ingreso Tipo Procedencia Fecha Materia Destino Clasif Anexos Obs Firma Timbre)
    th = th - %w(Clasif Firma Timbre) + %w(Ing.por)  if usuario.puesto.buzon.opartes
    th.delete("Id") unless usuario.es_admin?
    return "<th>" + th.join("</th><th>") + "</th>"
  end
  
  def th_firmas(opartes)
    return "<th>ing. por</th>" if opartes
    return "
    <th>firma            </th>
    <th>timbre          </th>
    "
  end
  
  def td_firmas(opartes)
    if opartes
      return "" 
    else
      return "    
    <td class='ancho' nowrap='nowrap'>. . . . . . . . . . . . . . .</td>
    <td class='ancho' nowrap='nowrap'>. . . . . . . . . . . . . . .</td>
   "
    end
  end
  
  # indica iniciales de anexos
  def anexos(doc)
    anexos = ""
    anexos << "D" if doc.anexo
    anexos << "S" if doc.sobre
    anexos << "P" if doc.paquete
    anexos    
  end
end
