module PreGuiaHelper
  def cantidad_column(record)
    record.copias.length
  end
end
