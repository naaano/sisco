class CapacitacionesController < ApplicationController
  active_scaffold do |config|
    config.label  = "Capacitaciones"
    config.list.columns = [:tema, :lugar, :fecha, :duracion, :asistentes]

    config.action_links.add 'inscribir', :type => :record, :position => false
    config.action_links.add 'desinscribir', :type => :record, :position => false
  end

  def inscribir
    record = Capacitacion.find(params[:id])
    record.inscribir
    active_scaffold_refresh_row(record)
  end
  
  def desinscribir
    record = Capacitacion.find(params[:id])
    record.desinscribir
    active_scaffold_refresh_row(record)
  end

end
