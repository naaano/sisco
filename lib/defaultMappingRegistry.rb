require 'default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsPFE = "http://www.vcglock.cl/PFE"
  NsXMLSchema = "http://www.w3.org/2001/XMLSchema"

  EncodedRegistry.register(
    :class => ArrayOfAnyType,
    :schema_type => XSD::QName.new(NsPFE, "ArrayOfAnyType"),
    :schema_element => [
      ["anyType", "[]", [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => ArrayOfAnyType,
    :schema_type => XSD::QName.new(NsPFE, "ArrayOfAnyType"),
    :schema_element => [
      ["anyType", "[]", [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarDocumentoFirmado,
    :schema_name => XSD::QName.new(NsPFE, "AgregarDocumentoFirmado"),
    :schema_element => [
      ["xmlDoc", "AgregarDocumentoFirmado::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarDocumentoFirmado::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarDocumentoFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "AgregarDocumentoFirmadoResponse"),
    :schema_element => [
      ["agregarDocumentoFirmadoResult", ["SOAP::SOAPLong", XSD::QName.new(NsPFE, "AgregarDocumentoFirmadoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirma,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirma"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["firmaElem", "VerificarFirma::FirmaElem", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirma::FirmaElem,
    :schema_name => XSD::QName.new(NsPFE, "firmaElem"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmaResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmaResponse"),
    :schema_element => [
      ["verificarFirmaResult", ["VerificarFirmaResponse::VerificarFirmaResult", XSD::QName.new(NsPFE, "VerificarFirmaResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmaResponse::VerificarFirmaResult,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmaResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoFirmado,
    :schema_name => XSD::QName.new(NsPFE, "VerificarDocumentoFirmado"),
    :schema_element => [
      ["xmlDoc", "VerificarDocumentoFirmado::XmlDoc", [0, 1]],
      ["idDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoFirmado::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarDocumentoFirmadoResponse"),
    :schema_element => [
      ["verificarDocumentoFirmadoResult", ["SOAP::SOAPBoolean", XSD::QName.new(NsPFE, "VerificarDocumentoFirmadoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoExterno,
    :schema_name => XSD::QName.new(NsPFE, "VerificarDocumentoExterno"),
    :schema_element => [
      ["xmlDoc", "VerificarDocumentoExterno::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoExterno::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarDocumentoExternoResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarDocumentoExternoResponse"),
    :schema_element => [
      ["verificarDocumentoExternoResult", ["SOAP::SOAPBoolean", XSD::QName.new(NsPFE, "VerificarDocumentoExternoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => BuscarDocumentosFirmado,
    :schema_name => XSD::QName.new(NsPFE, "BuscarDocumentosFirmado"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["nombreDoc", "SOAP::SOAPString", [0, 1]],
      ["folioDoc", "SOAP::SOAPString", [0, 1]],
      ["estado", "SOAP::SOAPString", [0, 1]],
      ["idTipDoc", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "IdTipDoc")]],
      ["pageIndex", "SOAP::SOAPInt"],
      ["pageSize", "SOAP::SOAPInt"],
      ["atributos", "BuscarDocumentosFirmado::Atributos", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => BuscarDocumentosFirmado::Atributos,
    :schema_name => XSD::QName.new(NsPFE, "atributos"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => BuscarDocumentosFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "BuscarDocumentosFirmadoResponse"),
    :schema_element => [
      ["buscarDocumentosFirmadoResult", ["BuscarDocumentosFirmadoResponse::BuscarDocumentosFirmadoResult", XSD::QName.new(NsPFE, "BuscarDocumentosFirmadoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => BuscarDocumentosFirmadoResponse::BuscarDocumentosFirmadoResult,
    :schema_name => XSD::QName.new(NsPFE, "BuscarDocumentosFirmadoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => CountBuscarDocumentosFirmado,
    :schema_name => XSD::QName.new(NsPFE, "CountBuscarDocumentosFirmado"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["nombreDoc", "SOAP::SOAPString", [0, 1]],
      ["folioDoc", "SOAP::SOAPString", [0, 1]],
      ["estado", "SOAP::SOAPString", [0, 1]],
      ["idTipDoc", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "IdTipDoc")]],
      ["atributos", "CountBuscarDocumentosFirmado::Atributos", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CountBuscarDocumentosFirmado::Atributos,
    :schema_name => XSD::QName.new(NsPFE, "atributos"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => CountBuscarDocumentosFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "CountBuscarDocumentosFirmadoResponse"),
    :schema_element => [
      ["countBuscarDocumentosFirmadoResult", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "CountBuscarDocumentosFirmadoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarFirma,
    :schema_name => XSD::QName.new(NsPFE, "AgregarFirma"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["firmaElem", "AgregarFirma::FirmaElem", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarFirma::FirmaElem,
    :schema_name => XSD::QName.new(NsPFE, "firmaElem"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => AgregarFirmaResponse,
    :schema_name => XSD::QName.new(NsPFE, "AgregarFirmaResponse"),
    :schema_element => [
      ["agregarFirmaResult", ["SOAP::SOAPLong", XSD::QName.new(NsPFE, "AgregarFirmaResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmasDocumento,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmasDocumento"),
    :schema_element => [
      ["iddoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmasDocumentoResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmasDocumentoResponse"),
    :schema_element => [
      ["verificarFirmasDocumentoResult", ["SOAP::SOAPBoolean", XSD::QName.new(NsPFE, "VerificarFirmasDocumentoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmasContraDocumento,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmasContraDocumento"),
    :schema_element => [
      ["xmlDoc", "VerificarFirmasContraDocumento::XmlDoc", [0, 1]],
      ["firmas", "ArrayOfAnyType", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmasContraDocumento::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarFirmasContraDocumentoResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarFirmasContraDocumentoResponse"),
    :schema_element => [
      ["verificarFirmasContraDocumentoResult", ["SOAP::SOAPBoolean", XSD::QName.new(NsPFE, "VerificarFirmasContraDocumentoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => VersionarDocumentoFirmado,
    :schema_name => XSD::QName.new(NsPFE, "VersionarDocumentoFirmado"),
    :schema_element => [
      ["xmlDoc", "VersionarDocumentoFirmado::XmlDoc", [0, 1]],
      ["idOrigDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => VersionarDocumentoFirmado::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VersionarDocumentoFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "VersionarDocumentoFirmadoResponse"),
    :schema_element => [
      ["versionarDocumentoFirmadoResult", ["SOAP::SOAPLong", XSD::QName.new(NsPFE, "VersionarDocumentoFirmadoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerDocumentoFirmado,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerDocumentoFirmado"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["validar", "SOAP::SOAPBoolean"]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerDocumentoFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerDocumentoFirmadoResponse"),
    :schema_element => [
      ["obtenerDocumentoFirmadoResult", ["ObtenerDocumentoFirmadoResponse::ObtenerDocumentoFirmadoResult", XSD::QName.new(NsPFE, "ObtenerDocumentoFirmadoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerDocumentoFirmadoResponse::ObtenerDocumentoFirmadoResult,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerDocumentoFirmadoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GuardarDocumentoNoFirmado,
    :schema_name => XSD::QName.new(NsPFE, "GuardarDocumentoNoFirmado"),
    :schema_element => [
      ["doc", "GuardarDocumentoNoFirmado::Doc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GuardarDocumentoNoFirmado::Doc,
    :schema_name => XSD::QName.new(NsPFE, "doc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GuardarDocumentoNoFirmadoResponse,
    :schema_name => XSD::QName.new(NsPFE, "GuardarDocumentoNoFirmadoResponse"),
    :schema_element => [
      ["guardarDocumentoNoFirmadoResult", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "GuardarDocumentoNoFirmadoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetIdDocumentoPosterior,
    :schema_name => XSD::QName.new(NsPFE, "GetIdDocumentoPosterior"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => GetIdDocumentoPosteriorResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetIdDocumentoPosteriorResponse"),
    :schema_element => [
      ["getIdDocumentoPosteriorResult", ["SOAP::SOAPLong", XSD::QName.new(NsPFE, "GetIdDocumentoPosteriorResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerArchivos,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerArchivos"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerArchivosResponse,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerArchivosResponse"),
    :schema_element => [
      ["obtenerArchivosResult", ["ObtenerArchivosResponse::ObtenerArchivosResult", XSD::QName.new(NsPFE, "ObtenerArchivosResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerArchivosResponse::ObtenerArchivosResult,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerArchivosResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerFirmas,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerFirmas"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"],
      ["validate", "SOAP::SOAPBoolean"]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerFirmasResponse,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerFirmasResponse"),
    :schema_element => [
      ["obtenerFirmasResult", ["ObtenerFirmasResponse::ObtenerFirmasResult", XSD::QName.new(NsPFE, "ObtenerFirmasResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ObtenerFirmasResponse::ObtenerFirmasResult,
    :schema_name => XSD::QName.new(NsPFE, "ObtenerFirmasResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetTiposDocumentoFirmados,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposDocumentoFirmados"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetTiposDocumentoFirmadosResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposDocumentoFirmadosResponse"),
    :schema_element => [
      ["getTiposDocumentoFirmadosResult", ["GetTiposDocumentoFirmadosResponse::GetTiposDocumentoFirmadosResult", XSD::QName.new(NsPFE, "GetTiposDocumentoFirmadosResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetTiposDocumentoFirmadosResponse::GetTiposDocumentoFirmadosResult,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposDocumentoFirmadosResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarCA,
    :schema_name => XSD::QName.new(NsPFE, "VerificarCA"),
    :schema_element => [
      ["issuerName", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => VerificarCAResponse,
    :schema_name => XSD::QName.new(NsPFE, "VerificarCAResponse"),
    :schema_element => [
      ["verificarCAResult", ["SOAP::SOAPBoolean", XSD::QName.new(NsPFE, "VerificarCAResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetTiposAtributos,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposAtributos"),
    :schema_element => [
      ["idTipoDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => GetTiposAtributosResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposAtributosResponse"),
    :schema_element => [
      ["getTiposAtributosResult", ["GetTiposAtributosResponse::GetTiposAtributosResult", XSD::QName.new(NsPFE, "GetTiposAtributosResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetTiposAtributosResponse::GetTiposAtributosResult,
    :schema_name => XSD::QName.new(NsPFE, "GetTiposAtributosResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => FindTipoAtributo,
    :schema_name => XSD::QName.new(NsPFE, "FindTipoAtributo"),
    :schema_element => [
      ["nombre", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FindTipoAtributoResponse,
    :schema_name => XSD::QName.new(NsPFE, "FindTipoAtributoResponse"),
    :schema_element => [
      ["findTipoAtributoResult", ["FindTipoAtributoResponse::FindTipoAtributoResult", XSD::QName.new(NsPFE, "FindTipoAtributoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => FindTipoAtributoResponse::FindTipoAtributoResult,
    :schema_name => XSD::QName.new(NsPFE, "FindTipoAtributoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetUsuarioByLogin,
    :schema_name => XSD::QName.new(NsPFE, "GetUsuarioByLogin"),
    :schema_element => [
      ["login", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetUsuarioByLoginResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetUsuarioByLoginResponse"),
    :schema_element => [
      ["getUsuarioByLoginResult", ["GetUsuarioByLoginResponse::GetUsuarioByLoginResult", XSD::QName.new(NsPFE, "GetUsuarioByLoginResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetUsuarioByLoginResponse::GetUsuarioByLoginResult,
    :schema_name => XSD::QName.new(NsPFE, "GetUsuarioByLoginResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocumentoVisualizador,
    :schema_name => XSD::QName.new(NsPFE, "GetDocumentoVisualizador"),
    :schema_element => [
      ["xmlDoc", "GetDocumentoVisualizador::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocumentoVisualizador::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocumentoVisualizadorResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetDocumentoVisualizadorResponse"),
    :schema_element => [
      ["getDocumentoVisualizadorResult", ["GetDocumentoVisualizadorResponse::GetDocumentoVisualizadorResult", XSD::QName.new(NsPFE, "GetDocumentoVisualizadorResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocumentoVisualizadorResponse::GetDocumentoVisualizadorResult,
    :schema_name => XSD::QName.new(NsPFE, "GetDocumentoVisualizadorResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerateXmlWithId,
    :schema_name => XSD::QName.new(NsPFE, "GenerateXmlWithId"),
    :schema_element => [
      ["xmlDoc", "GenerateXmlWithId::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerateXmlWithId::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerateXmlWithIdResponse,
    :schema_name => XSD::QName.new(NsPFE, "GenerateXmlWithIdResponse"),
    :schema_element => [
      ["generateXmlWithIdResult", ["GenerateXmlWithIdResponse::GenerateXmlWithIdResult", XSD::QName.new(NsPFE, "GenerateXmlWithIdResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerateXmlWithIdResponse::GenerateXmlWithIdResult,
    :schema_name => XSD::QName.new(NsPFE, "GenerateXmlWithIdResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetIdFromXml,
    :schema_name => XSD::QName.new(NsPFE, "GetIdFromXml"),
    :schema_element => [
      ["xmlDoc", "GetIdFromXml::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetIdFromXml::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetIdFromXmlResponse,
    :schema_name => XSD::QName.new(NsPFE, "GetIdFromXmlResponse"),
    :schema_element => [
      ["getIdFromXmlResult", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "GetIdFromXmlResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerarId,
    :schema_name => XSD::QName.new(NsPFE, "GenerarId"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GenerarIdResponse,
    :schema_name => XSD::QName.new(NsPFE, "GenerarIdResponse"),
    :schema_element => [
      ["generarIdResult", ["SOAP::SOAPInt", XSD::QName.new(NsPFE, "GenerarIdResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerarXML,
    :schema_name => XSD::QName.new(NsPFE, "GenerarXML"),
    :schema_element => [
      ["doc", "GenerarXML::Doc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerarXML::Doc,
    :schema_name => XSD::QName.new(NsPFE, "doc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerarXMLResponse,
    :schema_name => XSD::QName.new(NsPFE, "GenerarXMLResponse"),
    :schema_element => [
      ["generarXMLResult", ["GenerarXMLResponse::GenerarXMLResult", XSD::QName.new(NsPFE, "GenerarXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GenerarXMLResponse::GenerarXMLResult,
    :schema_name => XSD::QName.new(NsPFE, "GenerarXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => LeerDocumento,
    :schema_name => XSD::QName.new(NsPFE, "LeerDocumento"),
    :schema_element => [
      ["xmlDoc", "LeerDocumento::XmlDoc", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => LeerDocumento::XmlDoc,
    :schema_name => XSD::QName.new(NsPFE, "xmlDoc"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => LeerDocumentoResponse,
    :schema_name => XSD::QName.new(NsPFE, "LeerDocumentoResponse"),
    :schema_element => [
      ["leerDocumentoResult", ["LeerDocumentoResponse::LeerDocumentoResult", XSD::QName.new(NsPFE, "LeerDocumentoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => LeerDocumentoResponse::LeerDocumentoResult,
    :schema_name => XSD::QName.new(NsPFE, "LeerDocumentoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DuplicarDocumento,
    :schema_name => XSD::QName.new(NsPFE, "DuplicarDocumento"),
    :schema_element => [
      ["idDoc", "SOAP::SOAPInt"]
    ]
  )

  LiteralRegistry.register(
    :class => DuplicarDocumentoResponse,
    :schema_name => XSD::QName.new(NsPFE, "DuplicarDocumentoResponse"),
    :schema_element => [
      ["duplicarDocumentoResult", ["DuplicarDocumentoResponse::DuplicarDocumentoResult", XSD::QName.new(NsPFE, "DuplicarDocumentoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DuplicarDocumentoResponse::DuplicarDocumentoResult,
    :schema_name => XSD::QName.new(NsPFE, "DuplicarDocumentoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DocumentoFirmadoEntity,
    :schema_name => XSD::QName.new(NsPFE, "DocumentoFirmadoEntity"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => ArchivoList,
    :schema_name => XSD::QName.new(NsPFE, "ArchivoList"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => FirmaList,
    :schema_name => XSD::QName.new(NsPFE, "FirmaList"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => TipoDocumentoFirmadoList,
    :schema_name => XSD::QName.new(NsPFE, "TipoDocumentoFirmadoList"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => TipoAtributoBaseList,
    :schema_name => XSD::QName.new(NsPFE, "TipoAtributoBaseList"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => TipoAtributoEntity,
    :schema_name => XSD::QName.new(NsPFE, "TipoAtributoEntity"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => User,
    :schema_name => XSD::QName.new(NsPFE, "User"),
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

end
