module BorradorHelper
  def options_for_association_conditions(association)
    if association.name == :origen_puesto
      ['buzon_id =?', session[:usuario].puesto.buzon_id ]
    else
      super
    end
  end 

end
