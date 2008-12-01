require 'xsd/qname'

# {http://www.vcglock.cl/PFE}ArrayOfAnyType
class ArrayOfAnyType < ::Array
end

# {http://www.vcglock.cl/PFE}AgregarDocumentoFirmado
#   xmlDoc - AgregarDocumentoFirmado::XmlDoc
class AgregarDocumentoFirmado

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}AgregarDocumentoFirmadoResponse
#   agregarDocumentoFirmadoResult - SOAP::SOAPLong
class AgregarDocumentoFirmadoResponse
  attr_accessor :agregarDocumentoFirmadoResult

  def initialize(agregarDocumentoFirmadoResult = nil)
    @agregarDocumentoFirmadoResult = agregarDocumentoFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirma
#   idDoc - SOAP::SOAPInt
#   firmaElem - VerificarFirma::FirmaElem
class VerificarFirma

  # inner class for member: firmaElem
  # {http://www.vcglock.cl/PFE}firmaElem
  class FirmaElem
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :idDoc
  attr_accessor :firmaElem

  def initialize(idDoc = nil, firmaElem = nil)
    @idDoc = idDoc
    @firmaElem = firmaElem
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirmaResponse
#   verificarFirmaResult - VerificarFirmaResponse::VerificarFirmaResult
class VerificarFirmaResponse

  # inner class for member: VerificarFirmaResult
  # {http://www.vcglock.cl/PFE}VerificarFirmaResult
  class VerificarFirmaResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :verificarFirmaResult

  def initialize(verificarFirmaResult = nil)
    @verificarFirmaResult = verificarFirmaResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarDocumentoFirmado
#   xmlDoc - VerificarDocumentoFirmado::XmlDoc
#   idDoc - SOAP::SOAPInt
class VerificarDocumentoFirmado

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc
  attr_accessor :idDoc

  def initialize(xmlDoc = nil, idDoc = nil)
    @xmlDoc = xmlDoc
    @idDoc = idDoc
  end
end

# {http://www.vcglock.cl/PFE}VerificarDocumentoFirmadoResponse
#   verificarDocumentoFirmadoResult - SOAP::SOAPBoolean
class VerificarDocumentoFirmadoResponse
  attr_accessor :verificarDocumentoFirmadoResult

  def initialize(verificarDocumentoFirmadoResult = nil)
    @verificarDocumentoFirmadoResult = verificarDocumentoFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarDocumentoExterno
#   xmlDoc - VerificarDocumentoExterno::XmlDoc
class VerificarDocumentoExterno

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}VerificarDocumentoExternoResponse
#   verificarDocumentoExternoResult - SOAP::SOAPBoolean
class VerificarDocumentoExternoResponse
  attr_accessor :verificarDocumentoExternoResult

  def initialize(verificarDocumentoExternoResult = nil)
    @verificarDocumentoExternoResult = verificarDocumentoExternoResult
  end
end

# {http://www.vcglock.cl/PFE}BuscarDocumentosFirmado
#   idDoc - SOAP::SOAPInt
#   nombreDoc - SOAP::SOAPString
#   folioDoc - SOAP::SOAPString
#   estado - SOAP::SOAPString
#   idTipDoc - SOAP::SOAPInt
#   pageIndex - SOAP::SOAPInt
#   pageSize - SOAP::SOAPInt
#   atributos - BuscarDocumentosFirmado::Atributos
class BuscarDocumentosFirmado

  # inner class for member: atributos
  # {http://www.vcglock.cl/PFE}atributos
  class Atributos
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :idDoc
  attr_accessor :nombreDoc
  attr_accessor :folioDoc
  attr_accessor :estado
  attr_accessor :idTipDoc
  attr_accessor :pageIndex
  attr_accessor :pageSize
  attr_accessor :atributos

  def initialize(idDoc = nil, nombreDoc = nil, folioDoc = nil, estado = nil, idTipDoc = nil, pageIndex = nil, pageSize = nil, atributos = nil)
    @idDoc = idDoc
    @nombreDoc = nombreDoc
    @folioDoc = folioDoc
    @estado = estado
    @idTipDoc = idTipDoc
    @pageIndex = pageIndex
    @pageSize = pageSize
    @atributos = atributos
  end
end

# {http://www.vcglock.cl/PFE}BuscarDocumentosFirmadoResponse
#   buscarDocumentosFirmadoResult - BuscarDocumentosFirmadoResponse::BuscarDocumentosFirmadoResult
class BuscarDocumentosFirmadoResponse

  # inner class for member: BuscarDocumentosFirmadoResult
  # {http://www.vcglock.cl/PFE}BuscarDocumentosFirmadoResult
  class BuscarDocumentosFirmadoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :buscarDocumentosFirmadoResult

  def initialize(buscarDocumentosFirmadoResult = nil)
    @buscarDocumentosFirmadoResult = buscarDocumentosFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmado
#   idDoc - SOAP::SOAPInt
#   nombreDoc - SOAP::SOAPString
#   folioDoc - SOAP::SOAPString
#   estado - SOAP::SOAPString
#   idTipDoc - SOAP::SOAPInt
#   atributos - CountBuscarDocumentosFirmado::Atributos
class CountBuscarDocumentosFirmado

  # inner class for member: atributos
  # {http://www.vcglock.cl/PFE}atributos
  class Atributos
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :idDoc
  attr_accessor :nombreDoc
  attr_accessor :folioDoc
  attr_accessor :estado
  attr_accessor :idTipDoc
  attr_accessor :atributos

  def initialize(idDoc = nil, nombreDoc = nil, folioDoc = nil, estado = nil, idTipDoc = nil, atributos = nil)
    @idDoc = idDoc
    @nombreDoc = nombreDoc
    @folioDoc = folioDoc
    @estado = estado
    @idTipDoc = idTipDoc
    @atributos = atributos
  end
end

# {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmadoResponse
#   countBuscarDocumentosFirmadoResult - SOAP::SOAPInt
class CountBuscarDocumentosFirmadoResponse
  attr_accessor :countBuscarDocumentosFirmadoResult

  def initialize(countBuscarDocumentosFirmadoResult = nil)
    @countBuscarDocumentosFirmadoResult = countBuscarDocumentosFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}AgregarFirma
#   idDoc - SOAP::SOAPInt
#   firmaElem - AgregarFirma::FirmaElem
class AgregarFirma

  # inner class for member: firmaElem
  # {http://www.vcglock.cl/PFE}firmaElem
  class FirmaElem
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :idDoc
  attr_accessor :firmaElem

  def initialize(idDoc = nil, firmaElem = nil)
    @idDoc = idDoc
    @firmaElem = firmaElem
  end
end

# {http://www.vcglock.cl/PFE}AgregarFirmaResponse
#   agregarFirmaResult - SOAP::SOAPLong
class AgregarFirmaResponse
  attr_accessor :agregarFirmaResult

  def initialize(agregarFirmaResult = nil)
    @agregarFirmaResult = agregarFirmaResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirmasDocumento
#   iddoc - SOAP::SOAPInt
class VerificarFirmasDocumento
  attr_accessor :iddoc

  def initialize(iddoc = nil)
    @iddoc = iddoc
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirmasDocumentoResponse
#   verificarFirmasDocumentoResult - SOAP::SOAPBoolean
class VerificarFirmasDocumentoResponse
  attr_accessor :verificarFirmasDocumentoResult

  def initialize(verificarFirmasDocumentoResult = nil)
    @verificarFirmasDocumentoResult = verificarFirmasDocumentoResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumento
#   xmlDoc - VerificarFirmasContraDocumento::XmlDoc
#   firmas - ArrayOfAnyType
class VerificarFirmasContraDocumento

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc
  attr_accessor :firmas

  def initialize(xmlDoc = nil, firmas = nil)
    @xmlDoc = xmlDoc
    @firmas = firmas
  end
end

# {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumentoResponse
#   verificarFirmasContraDocumentoResult - SOAP::SOAPBoolean
class VerificarFirmasContraDocumentoResponse
  attr_accessor :verificarFirmasContraDocumentoResult

  def initialize(verificarFirmasContraDocumentoResult = nil)
    @verificarFirmasContraDocumentoResult = verificarFirmasContraDocumentoResult
  end
end

# {http://www.vcglock.cl/PFE}VersionarDocumentoFirmado
#   xmlDoc - VersionarDocumentoFirmado::XmlDoc
#   idOrigDoc - SOAP::SOAPInt
class VersionarDocumentoFirmado

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc
  attr_accessor :idOrigDoc

  def initialize(xmlDoc = nil, idOrigDoc = nil)
    @xmlDoc = xmlDoc
    @idOrigDoc = idOrigDoc
  end
end

# {http://www.vcglock.cl/PFE}VersionarDocumentoFirmadoResponse
#   versionarDocumentoFirmadoResult - SOAP::SOAPLong
class VersionarDocumentoFirmadoResponse
  attr_accessor :versionarDocumentoFirmadoResult

  def initialize(versionarDocumentoFirmadoResult = nil)
    @versionarDocumentoFirmadoResult = versionarDocumentoFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmado
#   idDoc - SOAP::SOAPInt
#   validar - SOAP::SOAPBoolean
class ObtenerDocumentoFirmado
  attr_accessor :idDoc
  attr_accessor :validar

  def initialize(idDoc = nil, validar = nil)
    @idDoc = idDoc
    @validar = validar
  end
end

# {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmadoResponse
#   obtenerDocumentoFirmadoResult - ObtenerDocumentoFirmadoResponse::ObtenerDocumentoFirmadoResult
class ObtenerDocumentoFirmadoResponse

  # inner class for member: ObtenerDocumentoFirmadoResult
  # {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmadoResult
  class ObtenerDocumentoFirmadoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :obtenerDocumentoFirmadoResult

  def initialize(obtenerDocumentoFirmadoResult = nil)
    @obtenerDocumentoFirmadoResult = obtenerDocumentoFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmado
#   doc - GuardarDocumentoNoFirmado::Doc
class GuardarDocumentoNoFirmado

  # inner class for member: doc
  # {http://www.vcglock.cl/PFE}doc
  class Doc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :doc

  def initialize(doc = nil)
    @doc = doc
  end
end

# {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmadoResponse
#   guardarDocumentoNoFirmadoResult - SOAP::SOAPInt
class GuardarDocumentoNoFirmadoResponse
  attr_accessor :guardarDocumentoNoFirmadoResult

  def initialize(guardarDocumentoNoFirmadoResult = nil)
    @guardarDocumentoNoFirmadoResult = guardarDocumentoNoFirmadoResult
  end
end

# {http://www.vcglock.cl/PFE}GetIdDocumentoPosterior
#   idDoc - SOAP::SOAPInt
class GetIdDocumentoPosterior
  attr_accessor :idDoc

  def initialize(idDoc = nil)
    @idDoc = idDoc
  end
end

# {http://www.vcglock.cl/PFE}GetIdDocumentoPosteriorResponse
#   getIdDocumentoPosteriorResult - SOAP::SOAPLong
class GetIdDocumentoPosteriorResponse
  attr_accessor :getIdDocumentoPosteriorResult

  def initialize(getIdDocumentoPosteriorResult = nil)
    @getIdDocumentoPosteriorResult = getIdDocumentoPosteriorResult
  end
end

# {http://www.vcglock.cl/PFE}ObtenerArchivos
#   idDoc - SOAP::SOAPInt
class ObtenerArchivos
  attr_accessor :idDoc

  def initialize(idDoc = nil)
    @idDoc = idDoc
  end
end

# {http://www.vcglock.cl/PFE}ObtenerArchivosResponse
#   obtenerArchivosResult - ObtenerArchivosResponse::ObtenerArchivosResult
class ObtenerArchivosResponse

  # inner class for member: ObtenerArchivosResult
  # {http://www.vcglock.cl/PFE}ObtenerArchivosResult
  class ObtenerArchivosResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :obtenerArchivosResult

  def initialize(obtenerArchivosResult = nil)
    @obtenerArchivosResult = obtenerArchivosResult
  end
end

# {http://www.vcglock.cl/PFE}ObtenerFirmas
#   idDoc - SOAP::SOAPInt
#   validate - SOAP::SOAPBoolean
class ObtenerFirmas
  attr_accessor :idDoc
  attr_accessor :validate

  def initialize(idDoc = nil, validate = nil)
    @idDoc = idDoc
    @validate = validate
  end
end

# {http://www.vcglock.cl/PFE}ObtenerFirmasResponse
#   obtenerFirmasResult - ObtenerFirmasResponse::ObtenerFirmasResult
class ObtenerFirmasResponse

  # inner class for member: ObtenerFirmasResult
  # {http://www.vcglock.cl/PFE}ObtenerFirmasResult
  class ObtenerFirmasResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :obtenerFirmasResult

  def initialize(obtenerFirmasResult = nil)
    @obtenerFirmasResult = obtenerFirmasResult
  end
end

# {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmados
class GetTiposDocumentoFirmados
  def initialize
  end
end

# {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmadosResponse
#   getTiposDocumentoFirmadosResult - GetTiposDocumentoFirmadosResponse::GetTiposDocumentoFirmadosResult
class GetTiposDocumentoFirmadosResponse

  # inner class for member: GetTiposDocumentoFirmadosResult
  # {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmadosResult
  class GetTiposDocumentoFirmadosResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getTiposDocumentoFirmadosResult

  def initialize(getTiposDocumentoFirmadosResult = nil)
    @getTiposDocumentoFirmadosResult = getTiposDocumentoFirmadosResult
  end
end

# {http://www.vcglock.cl/PFE}VerificarCA
#   issuerName - SOAP::SOAPString
class VerificarCA
  attr_accessor :issuerName

  def initialize(issuerName = nil)
    @issuerName = issuerName
  end
end

# {http://www.vcglock.cl/PFE}VerificarCAResponse
#   verificarCAResult - SOAP::SOAPBoolean
class VerificarCAResponse
  attr_accessor :verificarCAResult

  def initialize(verificarCAResult = nil)
    @verificarCAResult = verificarCAResult
  end
end

# {http://www.vcglock.cl/PFE}GetTiposAtributos
#   idTipoDoc - SOAP::SOAPInt
class GetTiposAtributos
  attr_accessor :idTipoDoc

  def initialize(idTipoDoc = nil)
    @idTipoDoc = idTipoDoc
  end
end

# {http://www.vcglock.cl/PFE}GetTiposAtributosResponse
#   getTiposAtributosResult - GetTiposAtributosResponse::GetTiposAtributosResult
class GetTiposAtributosResponse

  # inner class for member: GetTiposAtributosResult
  # {http://www.vcglock.cl/PFE}GetTiposAtributosResult
  class GetTiposAtributosResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getTiposAtributosResult

  def initialize(getTiposAtributosResult = nil)
    @getTiposAtributosResult = getTiposAtributosResult
  end
end

# {http://www.vcglock.cl/PFE}FindTipoAtributo
#   nombre - SOAP::SOAPString
class FindTipoAtributo
  attr_accessor :nombre

  def initialize(nombre = nil)
    @nombre = nombre
  end
end

# {http://www.vcglock.cl/PFE}FindTipoAtributoResponse
#   findTipoAtributoResult - FindTipoAtributoResponse::FindTipoAtributoResult
class FindTipoAtributoResponse

  # inner class for member: FindTipoAtributoResult
  # {http://www.vcglock.cl/PFE}FindTipoAtributoResult
  class FindTipoAtributoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :findTipoAtributoResult

  def initialize(findTipoAtributoResult = nil)
    @findTipoAtributoResult = findTipoAtributoResult
  end
end

# {http://www.vcglock.cl/PFE}GetUsuarioByLogin
#   login - SOAP::SOAPString
class GetUsuarioByLogin
  attr_accessor :login

  def initialize(login = nil)
    @login = login
  end
end

# {http://www.vcglock.cl/PFE}GetUsuarioByLoginResponse
#   getUsuarioByLoginResult - GetUsuarioByLoginResponse::GetUsuarioByLoginResult
class GetUsuarioByLoginResponse

  # inner class for member: GetUsuarioByLoginResult
  # {http://www.vcglock.cl/PFE}GetUsuarioByLoginResult
  class GetUsuarioByLoginResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getUsuarioByLoginResult

  def initialize(getUsuarioByLoginResult = nil)
    @getUsuarioByLoginResult = getUsuarioByLoginResult
  end
end

# {http://www.vcglock.cl/PFE}GetDocumentoVisualizador
#   xmlDoc - GetDocumentoVisualizador::XmlDoc
class GetDocumentoVisualizador

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}GetDocumentoVisualizadorResponse
#   getDocumentoVisualizadorResult - GetDocumentoVisualizadorResponse::GetDocumentoVisualizadorResult
class GetDocumentoVisualizadorResponse

  # inner class for member: GetDocumentoVisualizadorResult
  # {http://www.vcglock.cl/PFE}GetDocumentoVisualizadorResult
  class GetDocumentoVisualizadorResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getDocumentoVisualizadorResult

  def initialize(getDocumentoVisualizadorResult = nil)
    @getDocumentoVisualizadorResult = getDocumentoVisualizadorResult
  end
end

# {http://www.vcglock.cl/PFE}GenerateXmlWithId
#   xmlDoc - GenerateXmlWithId::XmlDoc
class GenerateXmlWithId

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}GenerateXmlWithIdResponse
#   generateXmlWithIdResult - GenerateXmlWithIdResponse::GenerateXmlWithIdResult
class GenerateXmlWithIdResponse

  # inner class for member: GenerateXmlWithIdResult
  # {http://www.vcglock.cl/PFE}GenerateXmlWithIdResult
  class GenerateXmlWithIdResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :generateXmlWithIdResult

  def initialize(generateXmlWithIdResult = nil)
    @generateXmlWithIdResult = generateXmlWithIdResult
  end
end

# {http://www.vcglock.cl/PFE}GetIdFromXml
#   xmlDoc - GetIdFromXml::XmlDoc
class GetIdFromXml

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}GetIdFromXmlResponse
#   getIdFromXmlResult - SOAP::SOAPInt
class GetIdFromXmlResponse
  attr_accessor :getIdFromXmlResult

  def initialize(getIdFromXmlResult = nil)
    @getIdFromXmlResult = getIdFromXmlResult
  end
end

# {http://www.vcglock.cl/PFE}GenerarId
class GenerarId
  def initialize
  end
end

# {http://www.vcglock.cl/PFE}GenerarIdResponse
#   generarIdResult - SOAP::SOAPInt
class GenerarIdResponse
  attr_accessor :generarIdResult

  def initialize(generarIdResult = nil)
    @generarIdResult = generarIdResult
  end
end

# {http://www.vcglock.cl/PFE}GenerarXML
#   doc - GenerarXML::Doc
class GenerarXML

  # inner class for member: doc
  # {http://www.vcglock.cl/PFE}doc
  class Doc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :doc

  def initialize(doc = nil)
    @doc = doc
  end
end

# {http://www.vcglock.cl/PFE}GenerarXMLResponse
#   generarXMLResult - GenerarXMLResponse::GenerarXMLResult
class GenerarXMLResponse

  # inner class for member: GenerarXMLResult
  # {http://www.vcglock.cl/PFE}GenerarXMLResult
  class GenerarXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :generarXMLResult

  def initialize(generarXMLResult = nil)
    @generarXMLResult = generarXMLResult
  end
end

# {http://www.vcglock.cl/PFE}LeerDocumento
#   xmlDoc - LeerDocumento::XmlDoc
class LeerDocumento

  # inner class for member: xmlDoc
  # {http://www.vcglock.cl/PFE}xmlDoc
  class XmlDoc
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xmlDoc

  def initialize(xmlDoc = nil)
    @xmlDoc = xmlDoc
  end
end

# {http://www.vcglock.cl/PFE}LeerDocumentoResponse
#   leerDocumentoResult - LeerDocumentoResponse::LeerDocumentoResult
class LeerDocumentoResponse

  # inner class for member: LeerDocumentoResult
  # {http://www.vcglock.cl/PFE}LeerDocumentoResult
  class LeerDocumentoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :leerDocumentoResult

  def initialize(leerDocumentoResult = nil)
    @leerDocumentoResult = leerDocumentoResult
  end
end

# {http://www.vcglock.cl/PFE}DuplicarDocumento
#   idDoc - SOAP::SOAPInt
class DuplicarDocumento
  attr_accessor :idDoc

  def initialize(idDoc = nil)
    @idDoc = idDoc
  end
end

# {http://www.vcglock.cl/PFE}DuplicarDocumentoResponse
#   duplicarDocumentoResult - DuplicarDocumentoResponse::DuplicarDocumentoResult
class DuplicarDocumentoResponse

  # inner class for member: DuplicarDocumentoResult
  # {http://www.vcglock.cl/PFE}DuplicarDocumentoResult
  class DuplicarDocumentoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :duplicarDocumentoResult

  def initialize(duplicarDocumentoResult = nil)
    @duplicarDocumentoResult = duplicarDocumentoResult
  end
end

# {http://www.vcglock.cl/PFE}DocumentoFirmadoEntity
class DocumentoFirmadoEntity
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}ArchivoList
class ArchivoList
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}FirmaList
class FirmaList
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}TipoDocumentoFirmadoList
class TipoDocumentoFirmadoList
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}TipoAtributoBaseList
class TipoAtributoBaseList
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}TipoAtributoEntity
class TipoAtributoEntity
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end

# {http://www.vcglock.cl/PFE}User
class User
  attr_reader :__xmlele_any

  def set_any(elements)
    @__xmlele_any = elements
  end

  def initialize
    @__xmlele_any = nil
  end
end
