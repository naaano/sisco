class Puesto < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :usuario
  has_many :rotaciones
  belongs_to :buzon
  
  def to_s
    nombre
  end
  
  fields do
    nombre :string
    buzon_id :integer
    usuario_id :integer
    cargo_id :integer
    opartes :boolean, :default => false
    firmante :boolean, :default => false
    editor :boolean, :default => false
    
    timestamps
  end
  
  def full_label
    buzon.sigla + '::' + nombre + '(' + usuario.to_label + ')'
  end

end
