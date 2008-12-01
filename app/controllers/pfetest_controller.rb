require 'soap/wsdlDriver'
require 'lib/defaultDriver'
require 'rexml/document'
require 'net/http' 
require 'xml_container'
require 'hpricot'
require 'net/ldap'
#require 'win32ole'
include REXML

class PfetestController < ApplicationController
  # clase para probar los web services de la PFE
  
  def index
    wsdl_url = "http://pfesite/pfeservice/PFEWebService.asmx?WSDL"
    
    # soap = SOAP::WSDLDriverFactory.new( wsdl_url ).create_rpc_driver
    
    # soap.wiredump_file_base = "tmp/soapresult" 
    
    param = {:idDoc => -1, :IdTipDoc => -1, :pageIndex => 1, :pageSize => 20}
    
    #@cantidad = soap.countBuscarDocumentosFirmado(param).countBuscarDocumentosFirmadoResult
    
    #@resultado = soap.BuscarDocumentosFirmado(param)
    #@resultado2 = soap.ObtenerDocumentoFirmado({:idDoc => 21725185, :validar => false})
    #@resultado = soap.GenerarXML(:doc => @resultado2.obtenerDocumentoFirmadoResult.documentoFirmado)
    #@r = @resultado2.obtenerDocumentoFirmadoResult.documentoFirmado
    #@resultado = soap.GenerarXML(:doc => @r)
    #@r = @resultado.buscarDocumentosFirmadoResult.list.documentoFirmado[1]
    
    str = <<EOF

<Documento xsi:schemaLocation="http://www.defensoria.cl/Memo http://www.defensoria.cl/Memo" urlDoc="http://www.vcgloc.cl/PFEDocs?idDoc=&amp;Nombre=Memo_4343&amp;Id=0" version="1.0" xmlns="http://www.defensoria.cl/Memo" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Contenido ID="DocFirmar" codigo="memo">
    <Folio>
      <Id>0</Id>
      <NoFolio>124510</NoFolio>
      <Anno>2008</Anno>
    </Folio>
    <Memo>
      <DAF>4343</DAF>
      <Antecedente>whweh</Antecedente>
      <Materia>vaas</Materia>
      <De>victor</De>
      <Para>jano</Para>
      <Glosa>lalal allala</Glosa>
    </Memo>
    <Id>0</Id>
    <Nombre>Memorandum</Nombre>
    <SistemaOrigen>Defensoria</SistemaOrigen>
    <Version>0</Version>
    <FechaIngreso>
      <year>2008</year>
      <month>7</month>
      <day>13</day>
      <hour>4</hour>
      <minute>5</minute>
      <second>16</second>
      <ticks>633515187164531250</ticks>
    </FechaIngreso>
  </Contenido>
</Documento>
EOF
    doc = Builder::XmlMarkup.new( :target => out_string = "", :indent => 2)
    doc.Test{
      doc.nombre("hernan")
      doc.apellido("astudillo")
    }     
    doc.instruct!
    #debugger
    #soap.allow_unqualified_element = true  
    # @resultado = soap.AgregarDocumentoFirmado(:xmlDoc => str )
    
    
    
  end
  
  
  def generar
    render :file => "pfetest/ejemplo.xml" , :layout => false, :use_full_path => true
    
  end
  
  def cliente
    
  end
  
  def firmar
    wsdl_url = "http://pfesite/pfeservice/PFEWebService.asmx?WSDL"
    
    soap = SOAP::WSDLDriverFactory.new( wsdl_url ).create_rpc_driver
    
    soap.wiredump_file_base = "tmp/soapresult" 
    
    # soap.AgregarDocumentoFirmado(:xmlDoc => params[:xmlFile] )
    
    d = Documento.find(:first)
    params[:xmlFile].rewind
    d.xml = params[:xmlFile].read
    d.save!
    
    soap.AgregarDocumentoFirmado(:xmlDoc => d.xml )
    
    render :text => "true"
  end
  
  def resultado
    d = Documento.find(:first, :conditions => "xml is not null")
    render :text => d.xml.to_s
  end
  
  def grabar
    d = Documento.find(:first, :conditions => "xml is not null")
    wsdl_url = "http://pfesite/pfeservice/PFEWebService.asmx?WSDL"
    soap = SOAP::WSDLDriverFactory.new( wsdl_url ).create_rpc_driver
    soap.wiredump_file_base = "tmp/soap_prueba"
    res = soap.AgregarDocumentoFirmado(:xmlDoc => d.xml )
    render :text => res
  end
  
  def soap4rtest
    wsdl_url = "http://127.0.0.1:8081/pfeservice/PFEWebService.asmx?WSDL"
    #obj = PFEWebServiceSoap.new 
    file   = File.open('/home/nano/aptana/workspace/sisco2/app/views/pfetest/ejemplo.xml', "r").read
    doc = Document.new(file)
    #obj.agregarDocumentoFirmado( :xmlDoc => doc)
    driver = SOAP::RPC::Driver.new(wsdl_url)
    
    #driver.default_encodingstyle = SOAP::EncodingStyle::ASPDotNetHandler::Namespace
    
    
    driver.add_method_with_soapaction("agregarDocumentoFirmado",
"http://www.vcglock.cl/PFE/AgregarDocumentoFirmado",
"xmlDoc")
    
    driver.wiredump_dev = STDOUT
    driver.wiredump_file_base = "log"
    driver.agregarDocumentoFirmado(doc)
  end
  
  def viahttp
    #xd = WIN32OLE.new('Microsoft.XMLDOM')
    #xd.loadXML(xml_doc)
    xml = xml_doc
    size = xml.size.to_s
    h = Net::HTTP.new('127.0.0.1', 8082)
    headers = { "Host" => "10.10.255.116", "Content-Type" => "text/xml; charset=utf-8","Content-Length" => size,"SOAPAction" => "http://www.vcglock.cl/PFE/AgregarDocumentoFirmado" }
    resp = h.post('/pfeservice/PFEWebService.asmx', xml, headers )
    render :text => resp 
  end
  
  def viahpricot
    wsdl_url = "http://localhost:8080/pfeservice/PFEWebService.asmx?WSDL"
    ns = "http://www.vcglock.cl/PFE"
    soapdriver = SOAP::RPC::Driver.new(wsdl_url, ns)
    soapdriver.use_default_namespace = true
    soapdriver.default_encodingstyle = SOAP::EncodingStyle::ASPDotNetHandler::Namespace
    soapdriver.generate_explicit_type = false 
    xml_doc = Hpricot::XML("<xmlDoc>" + File.read("/home/nano/Documentos/sisco/sisco_3/memo.xml") + "</xmlDoc>")
    xml_can = XMLContainer.new xml_doc.to_html
    soapdriver.add_method_with_soapaction("AgregarDocumentoFirmado","http://www.vcglock.cl/PFE/AgregarDocumentoFirmado","xmlDoc")
    soapdriver.AgregarDocumentoFirmado xml_can
  end
  
  def xml_doc
    file   = File.open('/home/nano/aptana/workspace/sisco2/memo2.xml', "r").read
    soap = <<EOF
<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><AgregarDocumentoFirmado xmlns="http://www.vcglock.cl/PFE"><xmlDoc>
EOF
    
    soapend ="</xmlDoc></AgregarDocumentoFirmado></soap:Body></soap:Envelope>"
    xml_doc = soap + file + soapend
  end
  
end
