class TrazasController < ApplicationController
  active_scaffold :traza do |config|
    config.actions.exclude :update, :delete, :create
  end
end
