class Traza < ActiveRecord::Base
  belongs_to :copia
  belongs_to :movimiento
  belongs_to :usuario
  
  fields do
    copia_id :integer
    movimiento_id :integer
    created_at :datetime
    usuario_id :integer
    buzon_id :integer 
  end
  
  def to_label
    "#{created_at} fué #{movimiento.nombre} por #{usuario.nombre}"
  end
end
