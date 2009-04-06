class Puesto < ActiveRecord::Base
  belongs_to :cargo
  belongs_to :usuario
  has_many :rotaciones
  belongs_to :buzon
  
  validates_presence_of :buzon
  validates_presence_of :cargo
  validates_length_of :nombre, :within => 4..100, :too_short => "es el nombre que recibe tu función, por ejemplo Secretaria, Editor, Webmaster, coordinador, etc.", :too_long => "podría ser un poquito más corto?"
  
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
    ingreso_papel :boolean, :default => false
    
    timestamps
  end
  
  def full_label
    buzon.sigla + '::' + nombre + '(' + usuario.to_label + ')'
  end
  
  # Solo el administrador puede eliminar puestos. NOTA: se pierden documentos y sus trazabilidades.
  # TODO debe bloquearse absolutamente en el futuro proximo.
  def authorized_for_destroy?
    current_user.es_admin?
  end
  

end
