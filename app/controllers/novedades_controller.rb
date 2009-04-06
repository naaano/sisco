class NovedadesController < ApplicationController
  active_scaffold do |config|
    config.columns[:texto].weight = 2
    config.columns[:muestra].inplace_edit = :true
    config.columns[:muestra].form_ui = :checkbox
    
  end
end
