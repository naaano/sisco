class Guia < ActiveRecord::Base
  has_and_belongs_to_many :copias #TODO actualmente esto se hace en un helper para guias/minutas solamente y no de manera global, :conditions => {:digital => true }
  belongs_to :buzon # quien genera la guia
  belongs_to :destinatario
  has_many :documentos, :through => :copias
 # belongs_to :puesto

  # devolvemos las copias que no han sido recepcionadas
  # TODO ahora sobran validaciones, puesto que no se puede borrar una guia que contenga una copia no rescatable. Sacarlas despues de probar "borrable".
  def before_destroy
    if self.copia_ids.size > 0
      RAILS_DEFAULT_LOGGER.warn "eliminando guia #{self.id} con copias #{self.copia_ids.join(",").to_s}"
      Copia.find(:all, :conditions => "id in (#{self.copia_ids.join(',').to_s})").each{ |c|
        c.rescatar if c.estado_id == 2
      }
      self.copias.clear
    end
  end
  
  def before_create
    self.buzon_id = current_user.puesto.buzon_id
  end
  
  fields do
    buzon_id :integer
    puesto_id :integer
    destinatario_id :integer
    destinos :string
    borrable :boolean, :default => true
    timestamps
  end
  
  def to_label
    "#{self.id}"
  end
  
  
  def cantidad
    self.copias.count
  end
  
  def recibidos
    copias.find(:all, :conditions => 'estado_id = 3').count
  end
  
  def total_recibidos
    "#{cantidad} / #{recibidos}"
  end
  
  def delete_authorized?
    #RAILS_DEFAULT_LOGGER.info "copias de guia a verificar: #{copias.inspect}"
    #return copias.find(:all, :conditions => 'estado_id = 3').count == 0
    borrable
    #return resp
  end
  
end
