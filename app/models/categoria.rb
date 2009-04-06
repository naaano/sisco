class Categoria < ActiveRecord::Base
  has_many :desarrollos
  
  validates_presence_of :nombre
  fields do
    nombre :string
  end
  
  def to_label
    nombre
  end
end
