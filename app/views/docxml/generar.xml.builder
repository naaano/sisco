xml.instruct! :xml, :version=>"1.0" 
#xml.instruct!('xml-stylesheet'.to_sym, :type=>"text/xsl", :href=> "/stylesheets/minrel.xsl")
xml.memo :xmlns => "http://esquemas.minrel.gov.cl/2008/1" do 
  xml.id @doc.id
  xml.origen{
    xml.entidad @doc.origen_texto, :id => @doc.origen_id, :sigla => @doc.origen.sigla
    xml.puesto{
      xml.cargo @doc.origen_puesto_texto
      xml.persona @doc.origen_persona_texto
    }
  }
  xml.destinatario{
    xml.entidad @doc.destinatario_texto, :id => @doc.destinatario_id, :sigla => Buzon.find(@doc.destinatario_id).sigla
    xml.puesto{
      xml.cargo @doc.destinatario_puesto_texto
      xml.persona @doc.destinatario_persona_texto
    }
  }
  xml.folio{
    xml.entidad @doc.origen.sigla
    xml.numero @doc.folio
    xml.agno @doc.updated_at.nil? ? @doc.updated_at.year : @doc.created_at.year
  }
  xml.materia @doc.materia
  xml.clasificacion @doc.clasificacion.nombre
  xml.accion @doc.accion.nombre
  xml.fecha @doc.updated_at.nil? ? @doc.updated_at : @doc.created_at
  xml.cuerpo @doc.cuerpo
  for dist in @doc.copias
    xml.distribucion{
      xml.entidad(dist.destinatario.nombre, :id => dist.destinatario_id, :sigla => dist.destinatario.sigla)
      xml.accion dist.accion.nombre unless dist.accion.nil?
    }
  end

end