module DocumentosHelper
  def conditions_for_association_collection(association)
    if association == :origen_puesto
      ["puestos.buzon_id = ?", session[:usuario].puesto.buzon_id]
    else
      super
    end
  end

end
