class Buzon < ActiveRecord::Base
  #sindicados al buzon
  has_many :puestos, :dependent => :destroy
  has_many :copias, :dependent => :destroy
  has_many :carpetas
  #has_many :documentos, :through => :copias
 # belongs_to :jerarquia

  def to_label
    sigla
  end

  fields do
    nombre :string, :name => true
    sigla :string
    descripcion :string
    folio :integer
    externo :boolean
  #  jerarquia_id :integer
    timestamps
  end
  
  def nuevo_folio
    update_attribute(:folio, folio + 1)
    folio
  end
  
  def authorized_for_update?
    current_user.es_admin?
  end

end
