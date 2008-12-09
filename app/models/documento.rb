require "rexml/document"
include REXML   
class Documento < ActiveRecord::Base
  belongs_to :tipo
  belongs_to :clasificacion
  belongs_to :accion
  belongs_to :origen
  belongs_to :usuario
  belongs_to :origen_puesto, :class_name => "Puesto", :foreign_key => 'origen_puesto_id'
  belongs_to :destinatario_puesto, :class_name => "Puesto", :foreign_key => 'destinatario_puesto_id'
  
  has_many :copias
  has_many :destinatarios, :through => :copias
  
  #validates_numericality_of :externo, :only_integer => true, :message => "solo los digitos del folio externo, por favor"
  #validates_presence_of :origen_puesto
  validates_presence_of :destinatario_puesto 
  validates_presence_of :materia
  validates_presence_of :accion
  validates_presence_of :clasificacion
  #validates_presence_of :cuerpo
  
  fields do
    origen_id :integer # entidad quien origina el documento
    origen_puesto_id :integer # puesto (persona) remitente
    origen_sigla :string #sigla del origen
    origen_texto :string #nombre del origen
    origen_puesto_texto :string #nombre del puesto
    origen_persona_texto :string #nombre de la persona
    
    destinatario_id :integer #entidad destinataria
    destinatario_puesto_id :integer # puesto a quien se dirige el doc
    destinatario_sigla :string # sigla del destinatario
    destinatario_texto :string #nombre del destinatario
    destinatario_puesto_texto :string #nombre del puesto
    destinatario_persona_texto :string #nombre de la persona
    
    usuario_id :integer # usuario quien ingreso el documento
    buzon_id :integer # buzon donde se crea el documento
    detalle_origen :string #otro origen... no usar 
    externo :integer #folio externo
    folio :integer #folio sisco , obligatorio
    folio_texto :string #folio completo, con formato CLAVE-folio/YEAR
    materia :string, :name => true
    digital :boolean, :default => false  # SISCO 3
    lock :boolean, :default => false #para electronico: true = para firma
    firma :boolean, :default => false #si el presente doc tiene firma
    
    tipo_id :integer
    clasificacion_id :integer
    accion_id :integer
    
    # tags :string  # OFF... evaluar estructura usando plugin de tags
    cuerpo :text
    referencia :string #contiene folios, pero deben ser parseados dinamicamente. 
    # parent_id :integer #para 1 referencia OFF...
    xml :text
    ### INTEGRACION PFE
    pfe :integer
    pfe_ok :boolean, :default => false
    parent_id :integer
    
    timestamps
  end
  
  def to_label
    folio_texto
  end
  
  def agno
    created_at.strftime('%y')
  end
  
  def before_create
    #self.buzon_id = 2
  end
  
  def after_create
    self.write_xml if self.digital
  end
  
  def enviar
    begin
      self.copias.each{ |c|
        c.estado_id = 2
        c.buzon_id = c.destinatario_id
        c.save!
      }
      self.lock = false
    end
  end
  
  def write_xml
    self.created_at = DateTime.now if self.created_at.nil?   
    
    doc = Document.new File.read(Rails.root + "/public/memo.xml")
    doc.elements["//memo/id"].text = self.id
    #doc.elements["//Contenido/Id"].text = self.id
    
    ## ORIGEN
    unless self.origen.nil?
      doc.elements["//origen/entidad"].attributes["id"] = self.origen_id 
      doc.elements["//origen/entidad"].attributes["sigla"] = self.origen.sigla 
      doc.elements["//origen/entidad"].text = self.origen.nombre
      doc.elements["//origen/puesto/cargo"].attributes["id"] = self.origen_puesto.cargo_id
      doc.elements["//origen/puesto/cargo"].text = self.origen_puesto_texto
      doc.elements["//origen/puesto/persona"].attributes["id"] = self.origen_puesto.usuario_id
      doc.elements["//origen/puesto/persona"].text = self.origen_puesto.usuario.to_label
      # DOCUMENTO
    doc.elements["//memo/folio"].attributes["id"] = self.id    
    doc.elements["//memo/folio/entidad"].text = self.origen.sigla    
    doc.elements["//memo/folio/numero"].text = self.folio    
    doc.elements["//memo/folio/agno"].text = self.created_at.year.to_s  
    end
    ## DESTINATARIO
    unless self.destinatario_puesto_id.nil?
    doc.elements["//destinatario/entidad"].attributes["id"] = self.destinatario_id
    doc.elements["//destinatario/entidad"].attributes["sigla"] = self.destinatario_sigla 
    doc.elements["//destinatario/entidad"].text = self.destinatario_texto
    doc.elements["//destinatario/puesto/cargo"].attributes["id"] = self.destinatario_puesto_id
    doc.elements["//destinatario/puesto/cargo"].text = self.destinatario_puesto_texto
    doc.elements["//destinatario/puesto/persona"].attributes["id"] = self.destinatario_puesto.usuario_id
    doc.elements["//destinatario/puesto/persona"].text = self.destinatario_puesto.usuario.to_label
    end
      
    doc.elements["//memo/materia"].text = self.materia  unless self.materia.nil?  
    
    doc.elements["//memo/clasificacion"].text = self.clasificacion.codigo unless self.clasificacion.nil?
    doc.elements["//memo/accion"].text = self.accion.nombre unless self.accion.nil?
    doc.elements["//memo/fecha"].text = self.created_at.to_s 
    doc.elements["//memo/tags"].text = "" 
    doc.elements["//memo/cuerpo"].text = self.cuerpo unless self.cuerpo.nil? 
    
    #REFERENCIA EN BLANCO
    self.copias.each {|d| 
      e = Element.new "distribucion"
      e.add_element "entidad"
      e.elements["entidad"].attributes["id"] = d.destinatario.id
      e.elements["entidad"].attributes["sigla"] = d.destinatario.sigla
      e.elements["entidad"].text = d.destinatario.nombre
      e.add_element "accion"
      e.elements["accion"].text = d.accion.to_s
      RAILS_DEFAULT_LOGGER.info e.to_s
      doc.elements["//memo"].add_element e
    }
    write_attribute(:xml, doc.to_s)
  end
  
  
  
  
  
  #CONTROL DE ACCIONES
  
  def corregir_authorized?
    self.firma == false and self.lock == true
  end
  
  def update_authorized?
    self.firma == false and self.lock == false
  end
  
  def firmar_authorized?
    self.firma == false and self.lock == true
  end
  
  def enviar_authorized?
    self.firma == true
  end
  
  def delete_authorized?
    self.firma == false and self.lock == false
  end
  
  
end
