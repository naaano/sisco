class Desarrollo < ActiveRecord::Base
  belongs_to :status
  belongs_to :categoria
  belongs_to :usuario
  
  validates_presence_of :titulo
  
  fields do
    titulo :string
    descripcion :text
    status_id :integer
    categoria_id :integer
    usuario_id :integer
    prioridad :integer
    hh :integer
    critico :boolean
    ememo :boolean
    finalizado :datetime
    entrega:datetime #compromiso de entrega
    timestamps
  end
  
  def to_label
    titulo
  end

end
