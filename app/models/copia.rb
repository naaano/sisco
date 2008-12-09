class Copia < ActiveRecord::Base
  belongs_to :documento
  belongs_to :carpeta
  belongs_to :estado
  belongs_to :buzon
  belongs_to :origen
  belongs_to :destinatario
  belongs_to :puesto
  belongs_to :accion
  has_and_belongs_to_many :guias
  has_many :trazas
  has_many :notas
  
  #validates_uniqueness_of :document_id , :scope => [:original => true ]

  
  fields do
    documento_id :integer
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
    "#{self.documento.origen.sigla}-#{self.documento.folio}-#{self.documento.created_at.strftime('%y')}" << copia
  end
  
  def folio
    copia = self.original == true ? '' : 'C'
    "#{documento.origen.sigla}-#{documento.folio}-#{documento.agno}#{copia}"
  end
  
  alias nro_documento folio
  
  def asignar(puesto)
    self.puesto_id = puesto
    self.save!
  end
  
  def materia
    self.documento.materia
  end
  
  def tipo
    self.documento.tipo
  end
  
  def cuerpo
    self.documento.cuerpo
  end
  
  def clasificacion
    self.documento.clasificacion
  end
  
  def creado_por
    self.documento.origen.to_label
  end
  
  
  def add_traza(usuario, movimiento )
    t = Traza.new(:copia_id => self.id, :movimiento_id => movimiento, :usuario_id => usuario)
    t.save
    self.trazas << t # tal vez al guardar despues la copia hace el paso anterior: guardar la traza
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
      self.estado_id = 3
      self.recepcion = Time.now
      return self.save
    end
  end
  
  def puede_recibir?
    return true if (estado_id == 2 and copia_en_buzon_propio?)
  end
  
  def puede_asignar?
    return true if (estado_id == 3 and copia_en_buzon_propio?)
  end
  
  def puede_archivar?
    return puede_asignar?
  end
  
  def recuperar_authorized?
    return true if (estado_id == 5 and copia_en_buzon_propio?)
  end
  
  # control de acceso al campo FIXME: separar por acciones crud
  def xml_authorized?
    self.documento.digital == true
  end
  
  def authorized_for_destroy?
    return true if self.estado_id == 1
    return false
  end
    
  
  def copia_en_buzon_propio?
    return (current_user.puesto.buzon == self.buzon)
  end
  
  def original
    false
  end
  
end
