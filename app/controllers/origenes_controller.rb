class OrigenesController < ApplicationController
  record_select :per_page => 10, :search_on => ['sigla','nombre'], :full_text_search => true, :label => proc {|r| r.full_label}
  active_scaffold :origen do |config|
    config.show.columns = [:sigla, :nombre, :descripcion, :folio, :externo]
    config.columns[:externo].form_ui = :checkbox
  end
  
#  def record_select_conditions_from_controller
#    "externo = true"
#  end
end
