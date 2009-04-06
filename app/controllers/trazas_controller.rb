class TrazasController < ApplicationController
  active_scaffold :traza do |config|
    config.actions.exclude :update, :delete, :create
    config.columns.exclude :puesto
  end
end
