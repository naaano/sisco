class TrazasController < ApplicationController
  active_scaffold :traza do |config|
    config.actions.exclude :update, :delete, :create, :nested
    config.columns.exclude :puesto
    config.list.columns = [:created_at, :movimiento, :usuario, :asignado]
  end
end
