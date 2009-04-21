class Buzon < ActiveRecord::Base
  acts_as_tree :order => "sigla", :foreign_key => "superior_id" #parent_id chocha con un metodo usado por record_select
  has_many :puestos, :dependent => :destroy
  has_many :copias, :dependent => :destroy
  has_many :carpetas
  has_many :documentos, :dependent => :destroy
  # belongs_to :jerarquia

  validates_presence_of :sigla
  validates_presence_of :nombre
  validates_length_of       :sigla,    :within => 2..16, :too_short => "una sigla que identifique el buzon", :too_long => "es muy largo, los numeros de ingreso quedaran incomodamente largos"
  validates_length_of       :nombre,    :within => 3..100, :too_short => "menos de 3 letras no sera muy corto?", :too_long => "hasta 100 letras por favor, que sino quedan muy grandes los selectores"
  validates_uniqueness_of   :sigla,    :case_sensitive => false
  validates_uniqueness_of   :nombre,    :case_sensitive => false
  
  def to_label
    nombre
  end
  
  fields do
    nombre :string
    sigla :string
    descripcion :string
    folio :integer
    externo :boolean # si no pertenece a la jerarquia interna minrel
    opartes :boolean # si es oficina de partes ministerial
    superior_id :integer
    recibe_de_todos :boolean, :default => true
    envia_a_todos :boolean, :default => true
    timestamps
  end
  
  #mueve el correlativo y devuelve el numero para el ingreso de docs fisicos y digitales
  def nuevo_folio
    increment!(:folio)
    folio
  end
  
  # todos los buzones relacionados entre si (dependientes y superiores)
  def parientes
    hermanos = parent ? self_and_siblings : [ self ]
    return children + ancestors + hermanos
  end
  
  def parientes_ids
    self.parientes.collect{|a| a.id}
  end
  
  def authorized_for_update?
    #FIXME esto no restringe que opartes pueda editar usando buzones_controller
    return true if current_user.puesto.buzon.opartes
    current_user.es_admin? or current_user.buzon.id = self.id
  end
  
  def externo_authorized_for_update?
    current_user.es_admin?
  end
  
  def opartes_authorized_for_update?
    current_user.es_admin?
  end
  
  def authorized_for_destroy?
    false #current_user.es_admin?
  end
  
  def puestos_authorized_for_update?
    current_user.es_admin? or current_user.buzon.id = self.id
  end
=begin  
  def self.run
    Copia.find(:all).map{|d| d.destroy}
    Documento.find(:all).map{|d| d.destroy}
    Buzon.find(:all, :conditions => "externo = true").map{|b| b.destroy}
    CSV::Reader.parse(File.open('origenes.csv', 'rb'), ';') do |row|
       Buzon.create(:sigla => row[0], :nombre => row[1], :folio => 1, :externo => true)
       #Buzon.find(:first, :conditions => {:nombre => row[1] }).destroy
      puts row[0] + " | " + row[1]
    end
  end
=end
end
