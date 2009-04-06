class CategoriasController < ApplicationController
  active_scaffold do |config|
    config.columns.exclude :desarrollos
  end
end
