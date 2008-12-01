require 'default.rb'
require 'defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class PFEWebServiceSoap < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://10.10.255.116/pfeservice/PFEWebService.asmx"

  Methods = [
    [ "http://www.vcglock.cl/PFE/AgregarDocumentoFirmado",
      "agregarDocumentoFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "AgregarDocumentoFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "AgregarDocumentoFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarFirma",
      "verificarFirma",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirma"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirmaResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarDocumentoFirmado",
      "verificarDocumentoFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarDocumentoFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarDocumentoFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarDocumentoExterno",
      "verificarDocumentoExterno",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarDocumentoExterno"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarDocumentoExternoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/BuscarDocumentosFirmado",
      "buscarDocumentosFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "BuscarDocumentosFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "BuscarDocumentosFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/CountBuscarDocumentosFirmado",
      "countBuscarDocumentosFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "CountBuscarDocumentosFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "CountBuscarDocumentosFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/AgregarFirma",
      "agregarFirma",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "AgregarFirma"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "AgregarFirmaResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarFirmasDocumento",
      "verificarFirmasDocumento",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirmasDocumento"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirmasDocumentoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarFirmasContraDocumento",
      "verificarFirmasContraDocumento",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirmasContraDocumento"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarFirmasContraDocumentoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VersionarDocumentoFirmado",
      "versionarDocumentoFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VersionarDocumentoFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VersionarDocumentoFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/ObtenerDocumentoFirmado",
      "obtenerDocumentoFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerDocumentoFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerDocumentoFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GuardarDocumentoNoFirmado",
      "guardarDocumentoNoFirmado",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GuardarDocumentoNoFirmado"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GuardarDocumentoNoFirmadoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetIdDocumentoPosterior",
      "getIdDocumentoPosterior",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetIdDocumentoPosterior"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetIdDocumentoPosteriorResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/ObtenerArchivos",
      "obtenerArchivos",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerArchivos"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerArchivosResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/ObtenerFirmas",
      "obtenerFirmas",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerFirmas"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "ObtenerFirmasResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetTiposDocumentoFirmados",
      "getTiposDocumentoFirmados",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetTiposDocumentoFirmados"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetTiposDocumentoFirmadosResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/VerificarCA",
      "verificarCA",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarCA"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "VerificarCAResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetTiposAtributos",
      "getTiposAtributos",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetTiposAtributos"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetTiposAtributosResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/FindTipoAtributo",
      "findTipoAtributo",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "FindTipoAtributo"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "FindTipoAtributoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetUsuarioByLogin",
      "getUsuarioByLogin",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetUsuarioByLogin"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetUsuarioByLoginResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetDocumentoVisualizador",
      "getDocumentoVisualizador",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetDocumentoVisualizador"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetDocumentoVisualizadorResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GenerateXmlWithId",
      "generateXmlWithId",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerateXmlWithId"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerateXmlWithIdResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GetIdFromXml",
      "getIdFromXml",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetIdFromXml"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GetIdFromXmlResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GenerarId",
      "generarId",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerarId"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerarIdResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/GenerarXML",
      "generarXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerarXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "GenerarXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/LeerDocumento",
      "leerDocumento",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "LeerDocumento"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "LeerDocumentoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://www.vcglock.cl/PFE/DuplicarDocumento",
      "duplicarDocumento",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "DuplicarDocumento"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://www.vcglock.cl/PFE", "DuplicarDocumentoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end



