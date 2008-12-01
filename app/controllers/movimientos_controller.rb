class MovimientosController < ApplicationController
  active_scaffold :movimiento do |config|
    config.list.columns = [:id, :nombre, :cantidad_de_trazas]
    #config.actions.exclude :delete
    config.actions.exclude :show
    
    config.create.columns = :nombre
    config.update.columns = :nombre
  end
end
