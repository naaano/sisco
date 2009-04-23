class BuzonesController < ApplicationController
  record_select :per_page => 10, :search_on => ['sigla','nombre'], :full_text_search => true, :label => proc {|r| r.full_label}
  
  active_scaffold :buzon do |config|
    config.list.columns = [:sigla, :nombre, :folio, :externo, :puestos , :opartes]
    config.create.columns = [:sigla, :nombre, :descripcion, :folio, :externo, :opartes, :parent]
    config.update.columns = [:sigla, :nombre, :descripcion, :folio, :externo, :opartes, :parent, :recibe_de_todos, :envia_a_todos]
    
    
    config.columns[:puestos].clear_link 
    config.columns[:externo].form_ui = :checkbox
    config.columns[:externo].inplace_edit = :true
    config.columns[:opartes].form_ui = :checkbox
    config.columns[:opartes].inplace_edit = :true
    config.columns[:nombre].inplace_edit = :true
    config.columns[:sigla].inplace_edit = :true
    
    config.columns[:parent].form_ui = :select
    config.columns[:recibe_de_todos].form_ui = :checkbox
    config.columns[:envia_a_todos].form_ui = :checkbox
      
  end
  

end
