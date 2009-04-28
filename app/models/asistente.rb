class Asistente < ActiveRecord::Base
  belongs_to :capacitacion
  belongs_to :usuario

  fields do
    capacitacion_id :integer, :nil => false
    usuario_id :integer, :nil => false
    asiste :boolean, :default => false
    timestamps
  end

  def to_label
    usuario.to_label
  end

  validates_presence_of :capacitacion
  validates_presence_of :usuario

  def authorized_for_destroy?
    current_user.es_admin?
  end

  def authorized_for_create?
    current_user.es_admin?
  end

  def authorized_for_update?
    current_user.es_admin?
  end

end
