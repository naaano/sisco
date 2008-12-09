class Correccion < ActiveRecord::Base
  belongs_to :usuario
  has_many :comentarios
  
  fields do
    descripcion :string, :length => 4095
    mensajes :string, :length => 4095
    corregido :boolean, :default => false
    critico :boolean, :default => false
    usuario_id :integer
    timestamps
  end
  
  def to_label 
    descripcion.size > 100 ? descripcion[0..100] + "..." : descripcion
  end

end
