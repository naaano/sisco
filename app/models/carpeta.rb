class Carpeta < ActiveRecord::Base
  belongs_to :buzon
  has_many :copias
  
  fields do
    nombre :string, :name => true
    buzon_id :integer
    
  end
  
  def to_label
    nombre
  end
end
