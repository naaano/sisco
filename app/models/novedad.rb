class Novedad < ActiveRecord::Base

  validates_presence_of :titulo

  fields do
    titulo :string
    texto :text
    mostrar :boolean, :default => false
    timestamps
  end
  
  def to_label
    titulo
  end
end
