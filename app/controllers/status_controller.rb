class StatusController < ApplicationController
  active_scaffold :status do |config|
    config.columns.exclude :desarrollos

#MAURICIO: 2 líneas siguientes agregadas
   config.list.columns = [:id, :nombre, :cantidad]
   config.actions.exclude :delete
  end
end
