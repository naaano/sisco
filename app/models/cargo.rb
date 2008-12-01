class Cargo < ActiveRecord::Base
  has_many :puestos
  
  def to_label
    nombre
  end
  
  fields do
    nombre :string
  end
end
