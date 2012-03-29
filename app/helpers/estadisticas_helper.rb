module EstadisticasHelper
  def arreglo(a)
    str = "'" + a.join("','") + "'"
    str
  end

  def simple(arr, tag ,color)
    ".simplegraph_more([#{arr.join(',')}],{penColor: '##{color}', yAxisCaption: '#{tag}'})"
  end
end
