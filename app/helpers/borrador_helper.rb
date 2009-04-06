module BorradorHelper
  def options_for_association_conditions(association)
    if association.name == :origen_puesto
      "buzon_id in (#{session[:usuario].puesto.buzon.parientes_ids.join(",")}) and firmante = true"
    else
      super
    end
  end 

end
