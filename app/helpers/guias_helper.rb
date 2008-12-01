module GuiasHelper
  def buzon_actual
    session[:usuario].puesto.buzon_id
  end
  
  def copias_column(record)
    Copia.find(:all, :conditions => ["buzon_id = ? AND estado_id = 1", session[:usuario].puesto.buzon_id])
  end
  
end
