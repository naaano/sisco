class EstadisticasController < ApplicationController
  def ememoxbuzon
    @d = Documento.find_by_sql "select buzones.sigla, count(*) as cantidad
from documentos
left join buzones on buzones.id = documentos.buzon_id
where digital = true and firma = true and not materia ~* 'prueba' and not materia ~* 'test'
group by buzones.sigla"
    @x = @d.collect{|a| "'" + a.sigla + "'"}.join(',')
    @y = @d.collect{|a| a.cantidad}.join(',')

    @semanal = Documento.find_by_sql "select buzones.sigla, to_char(date_trunc('week', documentos.fecha), 'YY-MM-W') as semana, count(*) as cantidad
from documentos
left join buzones on buzones.id = documentos.buzon_id
where digital = true and firma = true and not materia ~* 'prueba' and not materia ~* 'test'
group by buzones.sigla, semana
order by semana"

    @buzones = @semanal.collect{|d| d.sigla}.uniq
    @semanas = @semanal.collect{|d| d.semana.split("-").reverse.join("-") }.uniq
    @tabla = Hash.new(@buzones)
    @lineas= Hash.new(@buzones)
    @buzones.each{|b|
      @tabla[b] = Hash.new(0)
      @lineas[b] = Array.new(@semanas.length, 0)
      }
    @semanal.each{|s|
      sem = s.semana.split("-").reverse.join("-")
      @tabla[s.sigla][sem] = s.cantidad
      @lineas[s.sigla][@semanas.index(sem)] = s.cantidad
    }
    @colores = %w(ff8a8a 6094DB 6A6AFF 4AE371 DFDF00 FF9C42 59955C C06A45)
  end

  def ememoxbuzon_acumulado
  end

  def opartes
  end

  def usuarios
  end

end
