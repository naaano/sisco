class Guia < ActiveRecord::Base
  has_and_belongs_to_many :copias
  belongs_to :buzon # quien genera la guia
  
  def before_destroy
    self.copias.each{ |c|
      c.buzon_id = current_user.puesto.buzon_id if c.estado_id == 2
    }
  end
  
  fields do
    buzon_id :integer
    timestamps
  end
  
  def to_label
    "#{self.id}"
  end


  def cantidad
    self.copias.count
  end
  
  #retorna las copias de la guia al originante, SOLO si no han sido recepcionadas
  def devuelveme_copias
    self.copias.each{ |c|
      c.buzon_id = current_user.puesto.buzon_id if c.estado_id == 2
    }
  end

end
