#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = PFEWebServiceSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   AgregarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      AgregarDocumentoFirmado - {http://www.vcglock.cl/PFE}AgregarDocumentoFirmado
#
# RETURNS
#   parameters      AgregarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}AgregarDocumentoFirmadoResponse
#
parameters = nil
puts obj.agregarDocumentoFirmado(parameters)

# SYNOPSIS
#   VerificarFirma(parameters)
#
# ARGS
#   parameters      VerificarFirma - {http://www.vcglock.cl/PFE}VerificarFirma
#
# RETURNS
#   parameters      VerificarFirmaResponse - {http://www.vcglock.cl/PFE}VerificarFirmaResponse
#
parameters = nil
puts obj.verificarFirma(parameters)

# SYNOPSIS
#   VerificarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      VerificarDocumentoFirmado - {http://www.vcglock.cl/PFE}VerificarDocumentoFirmado
#
# RETURNS
#   parameters      VerificarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}VerificarDocumentoFirmadoResponse
#
parameters = nil
puts obj.verificarDocumentoFirmado(parameters)

# SYNOPSIS
#   VerificarDocumentoExterno(parameters)
#
# ARGS
#   parameters      VerificarDocumentoExterno - {http://www.vcglock.cl/PFE}VerificarDocumentoExterno
#
# RETURNS
#   parameters      VerificarDocumentoExternoResponse - {http://www.vcglock.cl/PFE}VerificarDocumentoExternoResponse
#
parameters = nil
puts obj.verificarDocumentoExterno(parameters)

# SYNOPSIS
#   BuscarDocumentosFirmado(parameters)
#
# ARGS
#   parameters      BuscarDocumentosFirmado - {http://www.vcglock.cl/PFE}BuscarDocumentosFirmado
#
# RETURNS
#   parameters      BuscarDocumentosFirmadoResponse - {http://www.vcglock.cl/PFE}BuscarDocumentosFirmadoResponse
#
parameters = nil
puts obj.buscarDocumentosFirmado(parameters)

# SYNOPSIS
#   CountBuscarDocumentosFirmado(parameters)
#
# ARGS
#   parameters      CountBuscarDocumentosFirmado - {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmado
#
# RETURNS
#   parameters      CountBuscarDocumentosFirmadoResponse - {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmadoResponse
#
parameters = nil
puts obj.countBuscarDocumentosFirmado(parameters)

# SYNOPSIS
#   AgregarFirma(parameters)
#
# ARGS
#   parameters      AgregarFirma - {http://www.vcglock.cl/PFE}AgregarFirma
#
# RETURNS
#   parameters      AgregarFirmaResponse - {http://www.vcglock.cl/PFE}AgregarFirmaResponse
#
parameters = nil
puts obj.agregarFirma(parameters)

# SYNOPSIS
#   VerificarFirmasDocumento(parameters)
#
# ARGS
#   parameters      VerificarFirmasDocumento - {http://www.vcglock.cl/PFE}VerificarFirmasDocumento
#
# RETURNS
#   parameters      VerificarFirmasDocumentoResponse - {http://www.vcglock.cl/PFE}VerificarFirmasDocumentoResponse
#
parameters = nil
puts obj.verificarFirmasDocumento(parameters)

# SYNOPSIS
#   VerificarFirmasContraDocumento(parameters)
#
# ARGS
#   parameters      VerificarFirmasContraDocumento - {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumento
#
# RETURNS
#   parameters      VerificarFirmasContraDocumentoResponse - {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumentoResponse
#
parameters = nil
puts obj.verificarFirmasContraDocumento(parameters)

# SYNOPSIS
#   VersionarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      VersionarDocumentoFirmado - {http://www.vcglock.cl/PFE}VersionarDocumentoFirmado
#
# RETURNS
#   parameters      VersionarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}VersionarDocumentoFirmadoResponse
#
parameters = nil
puts obj.versionarDocumentoFirmado(parameters)

# SYNOPSIS
#   ObtenerDocumentoFirmado(parameters)
#
# ARGS
#   parameters      ObtenerDocumentoFirmado - {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmado
#
# RETURNS
#   parameters      ObtenerDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmadoResponse
#
parameters = nil
puts obj.obtenerDocumentoFirmado(parameters)

# SYNOPSIS
#   GuardarDocumentoNoFirmado(parameters)
#
# ARGS
#   parameters      GuardarDocumentoNoFirmado - {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmado
#
# RETURNS
#   parameters      GuardarDocumentoNoFirmadoResponse - {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmadoResponse
#
parameters = nil
puts obj.guardarDocumentoNoFirmado(parameters)

# SYNOPSIS
#   GetIdDocumentoPosterior(parameters)
#
# ARGS
#   parameters      GetIdDocumentoPosterior - {http://www.vcglock.cl/PFE}GetIdDocumentoPosterior
#
# RETURNS
#   parameters      GetIdDocumentoPosteriorResponse - {http://www.vcglock.cl/PFE}GetIdDocumentoPosteriorResponse
#
parameters = nil
puts obj.getIdDocumentoPosterior(parameters)

# SYNOPSIS
#   ObtenerArchivos(parameters)
#
# ARGS
#   parameters      ObtenerArchivos - {http://www.vcglock.cl/PFE}ObtenerArchivos
#
# RETURNS
#   parameters      ObtenerArchivosResponse - {http://www.vcglock.cl/PFE}ObtenerArchivosResponse
#
parameters = nil
puts obj.obtenerArchivos(parameters)

# SYNOPSIS
#   ObtenerFirmas(parameters)
#
# ARGS
#   parameters      ObtenerFirmas - {http://www.vcglock.cl/PFE}ObtenerFirmas
#
# RETURNS
#   parameters      ObtenerFirmasResponse - {http://www.vcglock.cl/PFE}ObtenerFirmasResponse
#
parameters = nil
puts obj.obtenerFirmas(parameters)

# SYNOPSIS
#   GetTiposDocumentoFirmados(parameters)
#
# ARGS
#   parameters      GetTiposDocumentoFirmados - {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmados
#
# RETURNS
#   parameters      GetTiposDocumentoFirmadosResponse - {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmadosResponse
#
parameters = nil
puts obj.getTiposDocumentoFirmados(parameters)

# SYNOPSIS
#   VerificarCA(parameters)
#
# ARGS
#   parameters      VerificarCA - {http://www.vcglock.cl/PFE}VerificarCA
#
# RETURNS
#   parameters      VerificarCAResponse - {http://www.vcglock.cl/PFE}VerificarCAResponse
#
parameters = nil
puts obj.verificarCA(parameters)

# SYNOPSIS
#   GetTiposAtributos(parameters)
#
# ARGS
#   parameters      GetTiposAtributos - {http://www.vcglock.cl/PFE}GetTiposAtributos
#
# RETURNS
#   parameters      GetTiposAtributosResponse - {http://www.vcglock.cl/PFE}GetTiposAtributosResponse
#
parameters = nil
puts obj.getTiposAtributos(parameters)

# SYNOPSIS
#   FindTipoAtributo(parameters)
#
# ARGS
#   parameters      FindTipoAtributo - {http://www.vcglock.cl/PFE}FindTipoAtributo
#
# RETURNS
#   parameters      FindTipoAtributoResponse - {http://www.vcglock.cl/PFE}FindTipoAtributoResponse
#
parameters = nil
puts obj.findTipoAtributo(parameters)

# SYNOPSIS
#   GetUsuarioByLogin(parameters)
#
# ARGS
#   parameters      GetUsuarioByLogin - {http://www.vcglock.cl/PFE}GetUsuarioByLogin
#
# RETURNS
#   parameters      GetUsuarioByLoginResponse - {http://www.vcglock.cl/PFE}GetUsuarioByLoginResponse
#
parameters = nil
puts obj.getUsuarioByLogin(parameters)

# SYNOPSIS
#   GetDocumentoVisualizador(parameters)
#
# ARGS
#   parameters      GetDocumentoVisualizador - {http://www.vcglock.cl/PFE}GetDocumentoVisualizador
#
# RETURNS
#   parameters      GetDocumentoVisualizadorResponse - {http://www.vcglock.cl/PFE}GetDocumentoVisualizadorResponse
#
parameters = nil
puts obj.getDocumentoVisualizador(parameters)

# SYNOPSIS
#   GenerateXmlWithId(parameters)
#
# ARGS
#   parameters      GenerateXmlWithId - {http://www.vcglock.cl/PFE}GenerateXmlWithId
#
# RETURNS
#   parameters      GenerateXmlWithIdResponse - {http://www.vcglock.cl/PFE}GenerateXmlWithIdResponse
#
parameters = nil
puts obj.generateXmlWithId(parameters)

# SYNOPSIS
#   GetIdFromXml(parameters)
#
# ARGS
#   parameters      GetIdFromXml - {http://www.vcglock.cl/PFE}GetIdFromXml
#
# RETURNS
#   parameters      GetIdFromXmlResponse - {http://www.vcglock.cl/PFE}GetIdFromXmlResponse
#
parameters = nil
puts obj.getIdFromXml(parameters)

# SYNOPSIS
#   GenerarId(parameters)
#
# ARGS
#   parameters      GenerarId - {http://www.vcglock.cl/PFE}GenerarId
#
# RETURNS
#   parameters      GenerarIdResponse - {http://www.vcglock.cl/PFE}GenerarIdResponse
#
parameters = nil
puts obj.generarId(parameters)

# SYNOPSIS
#   GenerarXML(parameters)
#
# ARGS
#   parameters      GenerarXML - {http://www.vcglock.cl/PFE}GenerarXML
#
# RETURNS
#   parameters      GenerarXMLResponse - {http://www.vcglock.cl/PFE}GenerarXMLResponse
#
parameters = nil
puts obj.generarXML(parameters)

# SYNOPSIS
#   LeerDocumento(parameters)
#
# ARGS
#   parameters      LeerDocumento - {http://www.vcglock.cl/PFE}LeerDocumento
#
# RETURNS
#   parameters      LeerDocumentoResponse - {http://www.vcglock.cl/PFE}LeerDocumentoResponse
#
parameters = nil
puts obj.leerDocumento(parameters)

# SYNOPSIS
#   DuplicarDocumento(parameters)
#
# ARGS
#   parameters      DuplicarDocumento - {http://www.vcglock.cl/PFE}DuplicarDocumento
#
# RETURNS
#   parameters      DuplicarDocumentoResponse - {http://www.vcglock.cl/PFE}DuplicarDocumentoResponse
#
parameters = nil
puts obj.duplicarDocumento(parameters)


endpoint_url = ARGV.shift
obj = PFEWebServiceSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   AgregarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      AgregarDocumentoFirmado - {http://www.vcglock.cl/PFE}AgregarDocumentoFirmado
#
# RETURNS
#   parameters      AgregarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}AgregarDocumentoFirmadoResponse
#
parameters = nil
puts obj.agregarDocumentoFirmado(parameters)

# SYNOPSIS
#   VerificarFirma(parameters)
#
# ARGS
#   parameters      VerificarFirma - {http://www.vcglock.cl/PFE}VerificarFirma
#
# RETURNS
#   parameters      VerificarFirmaResponse - {http://www.vcglock.cl/PFE}VerificarFirmaResponse
#
parameters = nil
puts obj.verificarFirma(parameters)

# SYNOPSIS
#   VerificarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      VerificarDocumentoFirmado - {http://www.vcglock.cl/PFE}VerificarDocumentoFirmado
#
# RETURNS
#   parameters      VerificarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}VerificarDocumentoFirmadoResponse
#
parameters = nil
puts obj.verificarDocumentoFirmado(parameters)

# SYNOPSIS
#   VerificarDocumentoExterno(parameters)
#
# ARGS
#   parameters      VerificarDocumentoExterno - {http://www.vcglock.cl/PFE}VerificarDocumentoExterno
#
# RETURNS
#   parameters      VerificarDocumentoExternoResponse - {http://www.vcglock.cl/PFE}VerificarDocumentoExternoResponse
#
parameters = nil
puts obj.verificarDocumentoExterno(parameters)

# SYNOPSIS
#   BuscarDocumentosFirmado(parameters)
#
# ARGS
#   parameters      BuscarDocumentosFirmado - {http://www.vcglock.cl/PFE}BuscarDocumentosFirmado
#
# RETURNS
#   parameters      BuscarDocumentosFirmadoResponse - {http://www.vcglock.cl/PFE}BuscarDocumentosFirmadoResponse
#
parameters = nil
puts obj.buscarDocumentosFirmado(parameters)

# SYNOPSIS
#   CountBuscarDocumentosFirmado(parameters)
#
# ARGS
#   parameters      CountBuscarDocumentosFirmado - {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmado
#
# RETURNS
#   parameters      CountBuscarDocumentosFirmadoResponse - {http://www.vcglock.cl/PFE}CountBuscarDocumentosFirmadoResponse
#
parameters = nil
puts obj.countBuscarDocumentosFirmado(parameters)

# SYNOPSIS
#   AgregarFirma(parameters)
#
# ARGS
#   parameters      AgregarFirma - {http://www.vcglock.cl/PFE}AgregarFirma
#
# RETURNS
#   parameters      AgregarFirmaResponse - {http://www.vcglock.cl/PFE}AgregarFirmaResponse
#
parameters = nil
puts obj.agregarFirma(parameters)

# SYNOPSIS
#   VerificarFirmasDocumento(parameters)
#
# ARGS
#   parameters      VerificarFirmasDocumento - {http://www.vcglock.cl/PFE}VerificarFirmasDocumento
#
# RETURNS
#   parameters      VerificarFirmasDocumentoResponse - {http://www.vcglock.cl/PFE}VerificarFirmasDocumentoResponse
#
parameters = nil
puts obj.verificarFirmasDocumento(parameters)

# SYNOPSIS
#   VerificarFirmasContraDocumento(parameters)
#
# ARGS
#   parameters      VerificarFirmasContraDocumento - {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumento
#
# RETURNS
#   parameters      VerificarFirmasContraDocumentoResponse - {http://www.vcglock.cl/PFE}VerificarFirmasContraDocumentoResponse
#
parameters = nil
puts obj.verificarFirmasContraDocumento(parameters)

# SYNOPSIS
#   VersionarDocumentoFirmado(parameters)
#
# ARGS
#   parameters      VersionarDocumentoFirmado - {http://www.vcglock.cl/PFE}VersionarDocumentoFirmado
#
# RETURNS
#   parameters      VersionarDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}VersionarDocumentoFirmadoResponse
#
parameters = nil
puts obj.versionarDocumentoFirmado(parameters)

# SYNOPSIS
#   ObtenerDocumentoFirmado(parameters)
#
# ARGS
#   parameters      ObtenerDocumentoFirmado - {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmado
#
# RETURNS
#   parameters      ObtenerDocumentoFirmadoResponse - {http://www.vcglock.cl/PFE}ObtenerDocumentoFirmadoResponse
#
parameters = nil
puts obj.obtenerDocumentoFirmado(parameters)

# SYNOPSIS
#   GuardarDocumentoNoFirmado(parameters)
#
# ARGS
#   parameters      GuardarDocumentoNoFirmado - {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmado
#
# RETURNS
#   parameters      GuardarDocumentoNoFirmadoResponse - {http://www.vcglock.cl/PFE}GuardarDocumentoNoFirmadoResponse
#
parameters = nil
puts obj.guardarDocumentoNoFirmado(parameters)

# SYNOPSIS
#   GetIdDocumentoPosterior(parameters)
#
# ARGS
#   parameters      GetIdDocumentoPosterior - {http://www.vcglock.cl/PFE}GetIdDocumentoPosterior
#
# RETURNS
#   parameters      GetIdDocumentoPosteriorResponse - {http://www.vcglock.cl/PFE}GetIdDocumentoPosteriorResponse
#
parameters = nil
puts obj.getIdDocumentoPosterior(parameters)

# SYNOPSIS
#   ObtenerArchivos(parameters)
#
# ARGS
#   parameters      ObtenerArchivos - {http://www.vcglock.cl/PFE}ObtenerArchivos
#
# RETURNS
#   parameters      ObtenerArchivosResponse - {http://www.vcglock.cl/PFE}ObtenerArchivosResponse
#
parameters = nil
puts obj.obtenerArchivos(parameters)

# SYNOPSIS
#   ObtenerFirmas(parameters)
#
# ARGS
#   parameters      ObtenerFirmas - {http://www.vcglock.cl/PFE}ObtenerFirmas
#
# RETURNS
#   parameters      ObtenerFirmasResponse - {http://www.vcglock.cl/PFE}ObtenerFirmasResponse
#
parameters = nil
puts obj.obtenerFirmas(parameters)

# SYNOPSIS
#   GetTiposDocumentoFirmados(parameters)
#
# ARGS
#   parameters      GetTiposDocumentoFirmados - {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmados
#
# RETURNS
#   parameters      GetTiposDocumentoFirmadosResponse - {http://www.vcglock.cl/PFE}GetTiposDocumentoFirmadosResponse
#
parameters = nil
puts obj.getTiposDocumentoFirmados(parameters)

# SYNOPSIS
#   VerificarCA(parameters)
#
# ARGS
#   parameters      VerificarCA - {http://www.vcglock.cl/PFE}VerificarCA
#
# RETURNS
#   parameters      VerificarCAResponse - {http://www.vcglock.cl/PFE}VerificarCAResponse
#
parameters = nil
puts obj.verificarCA(parameters)

# SYNOPSIS
#   GetTiposAtributos(parameters)
#
# ARGS
#   parameters      GetTiposAtributos - {http://www.vcglock.cl/PFE}GetTiposAtributos
#
# RETURNS
#   parameters      GetTiposAtributosResponse - {http://www.vcglock.cl/PFE}GetTiposAtributosResponse
#
parameters = nil
puts obj.getTiposAtributos(parameters)

# SYNOPSIS
#   FindTipoAtributo(parameters)
#
# ARGS
#   parameters      FindTipoAtributo - {http://www.vcglock.cl/PFE}FindTipoAtributo
#
# RETURNS
#   parameters      FindTipoAtributoResponse - {http://www.vcglock.cl/PFE}FindTipoAtributoResponse
#
parameters = nil
puts obj.findTipoAtributo(parameters)

# SYNOPSIS
#   GetUsuarioByLogin(parameters)
#
# ARGS
#   parameters      GetUsuarioByLogin - {http://www.vcglock.cl/PFE}GetUsuarioByLogin
#
# RETURNS
#   parameters      GetUsuarioByLoginResponse - {http://www.vcglock.cl/PFE}GetUsuarioByLoginResponse
#
parameters = nil
puts obj.getUsuarioByLogin(parameters)

# SYNOPSIS
#   GetDocumentoVisualizador(parameters)
#
# ARGS
#   parameters      GetDocumentoVisualizador - {http://www.vcglock.cl/PFE}GetDocumentoVisualizador
#
# RETURNS
#   parameters      GetDocumentoVisualizadorResponse - {http://www.vcglock.cl/PFE}GetDocumentoVisualizadorResponse
#
parameters = nil
puts obj.getDocumentoVisualizador(parameters)

# SYNOPSIS
#   GenerateXmlWithId(parameters)
#
# ARGS
#   parameters      GenerateXmlWithId - {http://www.vcglock.cl/PFE}GenerateXmlWithId
#
# RETURNS
#   parameters      GenerateXmlWithIdResponse - {http://www.vcglock.cl/PFE}GenerateXmlWithIdResponse
#
parameters = nil
puts obj.generateXmlWithId(parameters)

# SYNOPSIS
#   GetIdFromXml(parameters)
#
# ARGS
#   parameters      GetIdFromXml - {http://www.vcglock.cl/PFE}GetIdFromXml
#
# RETURNS
#   parameters      GetIdFromXmlResponse - {http://www.vcglock.cl/PFE}GetIdFromXmlResponse
#
parameters = nil
puts obj.getIdFromXml(parameters)

# SYNOPSIS
#   GenerarId(parameters)
#
# ARGS
#   parameters      GenerarId - {http://www.vcglock.cl/PFE}GenerarId
#
# RETURNS
#   parameters      GenerarIdResponse - {http://www.vcglock.cl/PFE}GenerarIdResponse
#
parameters = nil
puts obj.generarId(parameters)

# SYNOPSIS
#   GenerarXML(parameters)
#
# ARGS
#   parameters      GenerarXML - {http://www.vcglock.cl/PFE}GenerarXML
#
# RETURNS
#   parameters      GenerarXMLResponse - {http://www.vcglock.cl/PFE}GenerarXMLResponse
#
parameters = nil
puts obj.generarXML(parameters)

# SYNOPSIS
#   LeerDocumento(parameters)
#
# ARGS
#   parameters      LeerDocumento - {http://www.vcglock.cl/PFE}LeerDocumento
#
# RETURNS
#   parameters      LeerDocumentoResponse - {http://www.vcglock.cl/PFE}LeerDocumentoResponse
#
parameters = nil
puts obj.leerDocumento(parameters)

# SYNOPSIS
#   DuplicarDocumento(parameters)
#
# ARGS
#   parameters      DuplicarDocumento - {http://www.vcglock.cl/PFE}DuplicarDocumento
#
# RETURNS
#   parameters      DuplicarDocumentoResponse - {http://www.vcglock.cl/PFE}DuplicarDocumentoResponse
#
parameters = nil
puts obj.duplicarDocumento(parameters)


endpoint_url = ARGV.shift
obj = PFEWebServiceHttpGet.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   VerificarFirmasDocumento(iddoc)
#
# ARGS
#   iddoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
iddoc = nil
puts obj.verificarFirmasDocumento(iddoc)

# SYNOPSIS
#   ObtenerDocumentoFirmado(idDoc, validar)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#   validar         C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            DocumentoFirmadoEntity - {http://www.vcglock.cl/PFE}DocumentoFirmadoEntity
#
idDoc = validar = nil
puts obj.obtenerDocumentoFirmado(idDoc, validar)

# SYNOPSIS
#   GetIdDocumentoPosterior(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Long - {http://www.w3.org/2001/XMLSchema}long
#
idDoc = nil
puts obj.getIdDocumentoPosterior(idDoc)

# SYNOPSIS
#   ObtenerArchivos(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            ArchivoList - {http://www.vcglock.cl/PFE}ArchivoList
#
idDoc = nil
puts obj.obtenerArchivos(idDoc)

# SYNOPSIS
#   ObtenerFirmas(idDoc, validate)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#   validate        C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            FirmaList - {http://www.vcglock.cl/PFE}FirmaList
#
idDoc = validate = nil
puts obj.obtenerFirmas(idDoc, validate)

# SYNOPSIS
#   GetTiposDocumentoFirmados
#
# ARGS
#   N/A
#
# RETURNS
#   body            TipoDocumentoFirmadoList - {http://www.vcglock.cl/PFE}TipoDocumentoFirmadoList
#

puts obj.getTiposDocumentoFirmados

# SYNOPSIS
#   VerificarCA(issuerName)
#
# ARGS
#   issuerName      C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
issuerName = nil
puts obj.verificarCA(issuerName)

# SYNOPSIS
#   GetTiposAtributos(idTipoDoc)
#
# ARGS
#   idTipoDoc       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            TipoAtributoBaseList - {http://www.vcglock.cl/PFE}TipoAtributoBaseList
#
idTipoDoc = nil
puts obj.getTiposAtributos(idTipoDoc)

# SYNOPSIS
#   FindTipoAtributo(nombre)
#
# ARGS
#   nombre          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            TipoAtributoEntity - {http://www.vcglock.cl/PFE}TipoAtributoEntity
#
nombre = nil
puts obj.findTipoAtributo(nombre)

# SYNOPSIS
#   GetUsuarioByLogin(login)
#
# ARGS
#   login           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            User - {http://www.vcglock.cl/PFE}User
#
login = nil
puts obj.getUsuarioByLogin(login)

# SYNOPSIS
#   GenerarId
#
# ARGS
#   N/A
#
# RETURNS
#   body            Int - {http://www.w3.org/2001/XMLSchema}int
#

puts obj.generarId

# SYNOPSIS
#   DuplicarDocumento(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            DocumentoFirmadoEntity - {http://www.vcglock.cl/PFE}DocumentoFirmadoEntity
#
idDoc = nil
puts obj.duplicarDocumento(idDoc)


endpoint_url = ARGV.shift
obj = PFEWebServiceHttpPost.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   VerificarFirmasDocumento(iddoc)
#
# ARGS
#   iddoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
iddoc = nil
puts obj.verificarFirmasDocumento(iddoc)

# SYNOPSIS
#   ObtenerDocumentoFirmado(idDoc, validar)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#   validar         C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            DocumentoFirmadoEntity - {http://www.vcglock.cl/PFE}DocumentoFirmadoEntity
#
idDoc = validar = nil
puts obj.obtenerDocumentoFirmado(idDoc, validar)

# SYNOPSIS
#   GetIdDocumentoPosterior(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Long - {http://www.w3.org/2001/XMLSchema}long
#
idDoc = nil
puts obj.getIdDocumentoPosterior(idDoc)

# SYNOPSIS
#   ObtenerArchivos(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            ArchivoList - {http://www.vcglock.cl/PFE}ArchivoList
#
idDoc = nil
puts obj.obtenerArchivos(idDoc)

# SYNOPSIS
#   ObtenerFirmas(idDoc, validate)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#   validate        C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            FirmaList - {http://www.vcglock.cl/PFE}FirmaList
#
idDoc = validate = nil
puts obj.obtenerFirmas(idDoc, validate)

# SYNOPSIS
#   GetTiposDocumentoFirmados
#
# ARGS
#   N/A
#
# RETURNS
#   body            TipoDocumentoFirmadoList - {http://www.vcglock.cl/PFE}TipoDocumentoFirmadoList
#

puts obj.getTiposDocumentoFirmados

# SYNOPSIS
#   VerificarCA(issuerName)
#
# ARGS
#   issuerName      C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            Boolean - {http://www.w3.org/2001/XMLSchema}boolean
#
issuerName = nil
puts obj.verificarCA(issuerName)

# SYNOPSIS
#   GetTiposAtributos(idTipoDoc)
#
# ARGS
#   idTipoDoc       C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            TipoAtributoBaseList - {http://www.vcglock.cl/PFE}TipoAtributoBaseList
#
idTipoDoc = nil
puts obj.getTiposAtributos(idTipoDoc)

# SYNOPSIS
#   FindTipoAtributo(nombre)
#
# ARGS
#   nombre          C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            TipoAtributoEntity - {http://www.vcglock.cl/PFE}TipoAtributoEntity
#
nombre = nil
puts obj.findTipoAtributo(nombre)

# SYNOPSIS
#   GetUsuarioByLogin(login)
#
# ARGS
#   login           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            User - {http://www.vcglock.cl/PFE}User
#
login = nil
puts obj.getUsuarioByLogin(login)

# SYNOPSIS
#   GenerarId
#
# ARGS
#   N/A
#
# RETURNS
#   body            Int - {http://www.w3.org/2001/XMLSchema}int
#

puts obj.generarId

# SYNOPSIS
#   DuplicarDocumento(idDoc)
#
# ARGS
#   idDoc           C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            DocumentoFirmadoEntity - {http://www.vcglock.cl/PFE}DocumentoFirmadoEntity
#
idDoc = nil
puts obj.duplicarDocumento(idDoc)


