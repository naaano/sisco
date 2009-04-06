module CorreccionesHelper
  def comentarios_show_column(record)
    record.comentarios.collect{|c| "<h3>#{c.usuario.to_label} dijo:</h3><p>#{c.texto}</p>" }.join("")
  end
  
  def descripcion_show_column(record)
    "<p>#{record.descripcion}</p>"
  end
end
