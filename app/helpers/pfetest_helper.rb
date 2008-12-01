module PfetestHelper
  
  def arbol(soap, profundidad)
    res = ""
    unless profundidad > 10
      for a in soap.singleton_methods
        valor = soap.method(a)
        res << "<li><b>#{a}:</b>#{valor}<ul>" << arbol(soap.send(a) , profundidad + 1 ) << "</ul></li>" unless a =~ /=$/
      end
      
    else
      res << "<li>#{a}</li>"
    end
    
    return res
  end
  
end
