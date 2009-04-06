class Nota < ActiveRecord::Base
  belongs_to :copia
  belongs_to :puesto
  
  validates_length_of :texto, :minimum => 5, :message => "la nota es muy corta, nada más que decir?"
  
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
