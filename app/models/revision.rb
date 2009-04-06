class Revision < ActiveRecord::Base
  belongs_to :documento
  belongs_to :puesto
  
  validates_presence_of :documento
  validates_presence_of :puesto
  validates_presence_of :observacion
  
  fields do
    observacion :string, :limit => 2047
    puesto_id :integer, :nil => false
    documento_id :integer, :nil => false
    timestamps
  end
  
  def to_label
    observacion
  end
end
