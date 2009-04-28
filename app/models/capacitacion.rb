class Capacitacion < ActiveRecord::Base
  has_many :asistentes
  
  fields do
    tema :text, :nil => false
    fecha :datetime
    lugar :string
    duración :integer #minutos
    timestamps
  end

  validates_presence_of :tema

  def to_label
    "Capacitación Nº#{id}"
  end

  def inscribir
    asistentes.create(:usuario => current_user)
  end

  def desinscribir
    asistentes.find(:first, :conditions => "usuario_id = #{current_user.id}").destroy
  end

  def authorized_for_destroy?
    current_user.es_admin?
  end

  def authorized_for_update?
    current_user.es_admin?
  end

  def inscribir_authorized?
    return false if fecha.past?
    asistentes.find(:first, :conditions => "usuario_id = #{current_user.id}").nil?
  end
  def desinscribir_authorized?
    return false if fecha.past?
    !asistentes.find(:first, :conditions => "usuario_id = #{current_user.id}").nil?
  end

end
