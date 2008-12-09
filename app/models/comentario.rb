class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :correccion
  
  fields do
    usuario_id :integer
    correccion_id :integer
    texto :string, :length => 4095
    created_at :datetime
  end
  
  def to_label 
    texto.size > 100 ? texto[0..100] + "..." : texto
  end
end
