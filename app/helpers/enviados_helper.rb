module EnviadosHelper
def trazas_column(record)
     "<ul><li>" + record.trazas.collect{|t| h(t.to_label) }.join("<li>") + "</ul>"
 end
end
