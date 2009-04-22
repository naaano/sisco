class Copia < ActiveRecord::Base
  belongs_to :documento#, :include => :tipo
  belongs_to :carpeta
  belongs_to :estado
  belongs_to :buzon
  belongs_to :origen
  belongs_to :destinatario
  belongs_to :puesto
  belongs_to :accion
  has_and_belongs_to_many :guias, :order => "id"
  has_many :trazas
  has_many :notas
  delegate :copias, :copias=, :to => :documento
  delegate :folio_texto, :folio_externo, :folio_interno, :folio_opartes, :to => :documento
  # heredados del documento
  # delegate :tipo, :tipo=, :to =>  :documento
  validates_presence_of :documento
  validates_presence_of :destinatario
  #validates_uniqueness_of :document_id , :scope => [:original => true ]
  
  
  fields do
    documento_id :integer
    original :boolean, :default => false 
    accion_id :integer
    carpeta_id :integer
    estado_id :integer
    buzon_id :integer
    origen_id :integer
    destinatario_id :integer
    puesto_id :integer
    recepcion :datetime
    timestamps
  end
  
  def to_label
    copia = self.original == true ? '' : 'C'
    return "#{self.folio}#{copia}" 
  end
  
  def folio
    unless self.documento.nil?
    "#{self.documento.folio_texto}"
    else
    "-"
    end
    
  end
  
  def folio_externo
    documento.folio_externo
  end
  
  alias nro_doc folio_externo
  
  def asignar(puesto)
    self.puesto_id = puesto
    self.save!
  end
  
  def tipo
    documento.tipo
  end
  
  def digital
    documento.digital unless documento.nil?
  end
  
  def materia
    self.documento = Documento.new if self.documento.nil?
    self.documento.materia
  end
  
  def observaciones
    documento.observaciones
  end
  
  def cuerpo
    documento.cuerpo
  end
  
  def clasificacion
    documento.clasificacion
  end
  
  def procedencia
    documento.origen.to_label
  end
  
  def detalle_procedencia
    documento.detalle_origen
  end
  
  def anexos
    anexos = ""
    anexos << "D" if self.documento.anexo == true
    anexos << "S" if self.documento.sobre == true
    anexos << "P" if self.documento.paquete == true
    anexos
  end
  
  #PROBAR---- esto ta mal, cuando la copia aun no ha sido grabada y no tiene id
  def add_traza(usuario, movimiento, buzon = nil )
    buzon ||= usuario.puesto.buzon_id
    t = Traza.new(:copia_id => self.id, :movimiento_id => movimiento, :usuario_id => usuario, :buzon_id => buzon)
    # active_scaffold se encarga de grabar la traza
    self.trazas << t
  end
  
  def add_traza_usuario(asignado)
    t = Traza.new(:copia_id => self.id, :movimiento_id => 7, :usuario_id => current_user.id, :buzon_id => current_user.puesto.buzon_id, :asignado_id => asignado)
    ####    t.save ### esto se encarga de grabarlo active_scaffold, PROBAR!!
    self.trazas << t 
  end
  
  # envio de la copia de origen a destinatario
  def despachar
    self.estado_id = 2 # en ruta
    self.buzon_id = self.destinatario_id
    self.add_traza(current_user.id ,1, current_user.puesto.buzon_id)
    self.recepcion = Time.now
    self.save!
  end
  
  # devolver la copia de destinatario a origen
  def rescatar
    self.estado_id = 1 #salida si lo creo, entrada/foliado si lo redirijo
    self.estado_id = 3 if self.trazas.count(:conditions => 'movimiento_id in (2,7,8)') > 0
    if self.origen.externo
      RAILS_DEFAULT_LOGGER.info "devolviendo de origen externo #{self.origen.to_label} a #{self.documento.buzon}"
      self.buzon_id = self.documento.buzon_id
    else
      self.buzon_id = self.origen_id
    end
    self.add_traza(current_user.id, 14, current_user.puesto.buzon_id)
    self.save!
  end
  
  def fecha_recepcion
    return "-" if recepcion.nil?
    dia = updated_at.to_date
    hoy = Date.today
    if hoy == dia
      return recepcion.strftime('%l:%M %p') #updated_at.to_formated_s(:hora)
    elsif hoy.year == dia.year
      return recepcion.strftime('%e %b') #updated_at.to_formated_s(:short)
    else
      return recepcion.strftime('%e %b %y') #updated_at.to_formated_s(:fecha)
    end
  end
  
  def recibido
    if self.estado_id == 2
      traza_creada = Traza.create(:copia_id => self.id, :movimiento_id => 2, :usuario => current_user, :buzon_id => current_user.puesto.buzon_id)
      return false unless traza_creada
      self.estado_id = 3
      self.guias.last.update_attribute(:borrable, false) unless self.documento.digital == true  # una vez recibido un documento, no se puede borrar la guia que lo contiene.
      return true if self.save 
      #si llega aqui, algo malo paso.
      RAILS_DEFAULT_LOGGER.error "problemas de recepcion de copia id #{self.id}: recibido() en copia.rb"
      return false
    end
  end
  
  #### metodos para automatizar via consola
  def recibir_auto(usuario)
    if self.estado_id == 2
      traza_creada = Traza.create(:copia_id => self.id, :movimiento_id => 2, :usuario => usuario, :buzon_id => usuario.puesto.buzon_id)
      return false unless traza_creada
      self.estado_id = 3
      return true if self.save 
      #si llega aqui, algo malo paso.
      return false
    end
  end
  
  def archivar_auto(usuario, carpeta)
    Traza.create(:copia_id => self.id, :movimiento_id => 3, :usuario => usuario, :buzon_id => usuario.puesto.buzon_id)
    self.estado_id = 5
    self.carpeta_id = carpeta unless carpeta.nil?
  end
  
  def puede_recibir?
    return true if (estado_id == 2 and copia_en_buzon_propio?)
  end
  
  def puede_archivar?
    return self.puesto_authorized_for_update?
  end

  def puede_copiar?
    return true if copia_en_buzon_propio? and not (self.estado_id == 2)
  end
  
  def recuperar_authorized?
    return true if (estado_id == 5 and copia_en_buzon_propio?)
  end
  
  # control de acceso al campo 
  #TODO separar por acciones crud
  def xml_authorized?
    self.documento.digital == true
  end
  
  def firmar_authorized?
    self.documento.digital == true
  end
  
  def original_authorized_for_update?
    current_user.es_admin?
  end
  
  def puesto_authorized_for_update?
    copia_en_buzon_propio? and estado_id >= 3 and estado_id <= 5
  end
  
  def authorized_for_destroy?
    return true if self.estado_id == 1
    return false
  end
  
  #para bloquear el reenvio cuando no se ha recibido
  #def authorized_for_update?
  #  
  #end
  
  
  def copia_en_buzon_propio?
    return (current_user.puesto.buzon == self.buzon)
  end

  
end
