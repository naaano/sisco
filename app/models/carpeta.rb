class Carpeta < ActiveRecord::Base
  belongs_to :buzon
  has_many :copias
  
  validates_presence_of :nombre
  validates_presence_of :buzon
  
  fields do
    nombre :string, :name => true
    buzon_id :integer
  end
  
  def to_label
    nombre
  end
  
  def cantidad_de_copias
    copias.count
  end
end
