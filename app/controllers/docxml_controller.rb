require 'soap/wsdlDriver'
require 'xml_container'
require 'hpricot'
require 'xml/libxslt'

class DocxmlController < ApplicationController
  layout nil
  
  def generar
    @doc = Documento.find(params[:id])
    render :template => 'xml/generar.xml.builder'
  end
  
  def get_xml
    if not params[:format].nil?
      render :file => Rails.root + "/public/stylesheets/minrel.xsl"
    else
      render :text => Documento.find(params[:id]).xml
    end
  end
  
  def ver
    if not params[:format].nil? and params[:format] = "css"
      render :file => Rails.root +  "/public/stylesheets/#{params[:id]}.css"
      return
    end
    doc = Documento.find(params[:id]).xml
    tags = <<XML
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/stylesheets/minrel.xsl"?>
XML

    #xslt = XML::XSLT.new()
    #xslt.xml = doc
    #xslt.xsl = File.open(Rails.root + "/public/stylesheets/minrel.xsl").read

    render :text => tags + doc #xslt.serve() #tags + doc
  end
  
  def ver_copia
    params[:id] = Copia.find(params[:id]).documento_id
    ver
  end
  
  def descargar
  end
  
  def firmar
  end
  
  def subir
    params[:xmlFile].rewind
    doc = params[:xmlFile].read
    d = Documento.find(params[:id])
    unless d.nil? 
      d.xml = doc
      d.firma = true
      d.enviar
      d.save!      
      # almacenar_en_pfe(doc)
    end
    
  end
  
  protected
  
  
  def almacenar_en_pfe(doc)
    wsdl_url = "http://10.10.255.116/pfeservice/PFEWebService.asmx?WSDL"
    ns = "http://www.vcglock.cl/PFE"
    soapdriver = SOAP::RPC::Driver.new(wsdl_url, ns)
    soapdriver.use_default_namespace = true
    soapdriver.default_encodingstyle = SOAP::EncodingStyle::ASPDotNetHandler::Namespace
    soapdriver.generate_explicit_type = false 
    xml_doc = Hpricot::XML("<xmlDoc>" + doc + "</xmlDoc>")
    xml_can = XMLContainer.new xml_doc.to_html
    soapdriver.add_method_with_soapaction("AgregarDocumentoFirmado","http://www.vcglock.cl/PFE/AgregarDocumentoFirmado","xmlDoc")
    result = soapdriver.AgregarDocumentoFirmado xml_can
    render :text => result.inspect
  end
  
  def validar
  end
  
end
