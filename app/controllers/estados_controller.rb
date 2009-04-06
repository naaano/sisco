class EstadosController < ApplicationController
  active_scaffold :estado do |config|

    config.list.columns = [:id, :nombre, :cantidad_de_copias ]

    config.actions.exclude :show
    # config.actions.exclude :update
    config.actions.exclude :delete, :create
    #config.create.columns = :nombre
    #config.update.columns = :nombre
    #config.columns[:nombre].inplace_edit = true
  end
end
