require "rexml/document"
include REXML    # so that we don't have to prefix everything with
                 # REXML::..
class XmlController < ApplicationController
  layout nil
  
  def generar
    @doc = Documento.find(params[:id])
    #xml = Document.new File.new(Rails.root + "/public/memo_minrel.xml")
    render :template => 'xml/generar.xml.builder'
  end

  def ver
    doc = Documento.find(params[:id]).xml
    render :text => doc
  end

  def descargar
  end

  def firmar
  end

  def subir
    params[:xmlFile].rewind
    doc = Document.new params[:xmlFile].read
    d = Documento.find(doc.elements["/memo/id"].text.to_i  )
    unless d.nil?
      d.xml = doc
      self.successful = d.save
    else
      self.successful = false
    end
    
  end

  def validar
  end

end
