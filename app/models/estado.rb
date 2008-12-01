class Estado < ActiveRecord::Base
   has_many :copias, :dependent => :nullify
   
  fields do
    nombre :string, :name => true
    timestamps
  end

  def to_s
    nombre
  end
  
  def cantidad_de_copias
    self.copias.count  
  end
end
