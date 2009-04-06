class Correccion < ActiveRecord::Base
  belongs_to :usuario
  has_many :comentarios
  
  validates_presence_of :descripcion
  
  fields do
    descripcion :string, :limit => 4095
    corregido :boolean, :default => false
    critico :boolean, :default => false
    usuario_id :integer
    timestamps
  end
  
  def to_label 
    descripcion.size > 100 ? descripcion[0..100] + "..." : descripcion
  end

  def update_authorized?
    return current_user.es_admin?
  end

end
