class Nota < ActiveRecord::Base
  belongs_to :copia
  belongs_to :puesto
  
  validates_length_of :texto, :within => 5..255, :too_short => "la nota es muy corta, nada más que decir?", :too_long => "Nota de máximo %d letras, si no es mucha molestia"
  
  fields do
    texto :text
    copia_id :integer
    puesto_id :integer
    timestamps
  end
  
  def to_label
    texto.split[0..2].join(' ') + '...'
  end
end
