class Rotacion < ActiveRecord::Base
  
  # Por cada movimiento en un puesto, aqui se registra dicho movimiento:
  # Cuando se asigna un usuario a un puesto, asigna es TRUE
  # Cuando se da de baja a un usuario de un puesto, asigna es FALSE
  
  belongs_to :puesto
  belongs_to :usuario
  
  fields do
    puesto_id :integer, :nil => false
    usuario_id :integer, :nil => false
    asigna :boolean, :default => true
    created_at :datetime
  end

end
