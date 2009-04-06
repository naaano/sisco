class Traza < ActiveRecord::Base
  belongs_to :copia
  belongs_to :movimiento
  belongs_to :usuario
  belongs_to :asignado, :class_name => 'Puesto', :foreign_key => 'asignado_id'
  
  fields do
    copia_id :integer
    movimiento_id :integer
    created_at :datetime
    usuario_id :integer
    buzon_id :integer 
    asignado_id :integer
  end
  
  def to_label
    if self.movimiento_id == 7 and not asignado_id.nil? 
     return "#{created_at} fue asignado a #{Puesto.find(asignado_id).to_label} por #{usuario.nombre}(#{usuario.buzon.sigla})" 
    else
    return "#{created_at} fue #{movimiento.nombre} por #{usuario.nombre}(#{usuario.buzon.sigla})"
    end
  end
  
  #def puesto
  #  "" #Puesto.find(self.asignado_id) unless self.asignado_id.nil?
  #end
  
  
end
