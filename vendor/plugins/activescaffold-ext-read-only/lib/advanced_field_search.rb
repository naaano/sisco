# field_search for date range
module ActiveScaffold
  module Finder
    DateUnits = [
      ["Dias", :day],
      ["Semanas", :week],
      ["Meses", :month],
      ["Años", :year]
    ]

    DateRanges = [
      ["Hoy", "TODAY"], 
      ["Ayer", "YESTERDAY"], 
      ["Esta Semana", "THIS_WEEK"], 
      ["Semana Pasada", "PREV_WEEK"], 
      ["Este Mes", "THIS_MONTH"],
      ["Mes Pasado", "PREV_MONTH"],
      ["Este Cuarto", "THIS_QUARTER"],
      ["Cuarto Pasado", "PREV_QUARTER"],
      ["Este Año", "THIS_YEAR"],
      ["Año Pasado", "PREV_YEAR"],
      ["Rango", "CUSTOM"],
      ["Reciente", "TREND"]
    ]

    def self.condition_for_column(column, value, like_pattern = '%?%')
      return unless column and column.search_sql and value and not value.empty?
      case column.form_ui || column.column.type
        when :boolean, :checkbox
        ["#{column.search_sql} = ?", (value.to_i == 1)]

        when :integer, :decimal
        if value['number'].blank?
          nil
        elsif value['opt'] == 'BETWEEN'
          ["#{column.search_sql} between ? and ?", value['number'].to_f, value['number1'].to_f]
        else
          ["#{column.search_sql} #{value['opt']} ?", value['number'].to_f]
        end

        when :select
        ["#{column.search_sql} = ?", value.to_i]

        when :multi_select
        ["#{column.search_sql} in (?)", value.to_a]

        when :calendar_date_select
        if value['range'].blank?
          return nil
        elsif value['range'] == "TODAY"
          from_value = to_value = Date.today
        elsif value['range'] == "YESTERDAY"
          from_value = to_value = 1.day.ago.to_date
        elsif value['range'] == "THIS_WEEK"
          from_value = Time.today.beginning_of_week
          to_value = Time.today.beginning_of_week.in(7.days).ago(1.second)
        elsif value['range'] == "PREV_WEEK"
          from_value = Time.today.beginning_of_week.ago(7.days)
          to_value = Time.today.beginning_of_week.ago(1.second)
        elsif value['range'] == "THIS_MONTH"
          from_value = Time.today.beginning_of_month
          to_value = Time.today.end_of_month.in(1.day).ago(1.second)
        elsif value['range'] == "PREV_MONTH"
          from_value = Time.today.last_month.beginning_of_month
          to_value = Time.today.beginning_of_month.ago(1.second)
        elsif value['range'] == "THIS_QUARTER"
          from_value = Time.today.beginning_of_quarter
          to_value = 3.months.since.beginning_of_quarter.ago(1.second)
        elsif value['range'] == "PREV_QUARTER"
          from_value = 3.months.ago.beginning_of_quarter
          to_value = Time.today.beginning_of_quarter.ago(1.second)
        elsif value['range'] == "THIS_YEAR"
          from_value = Time.today.beginning_of_year
          to_value = 1.year.since.beginning_of_year.ago(1.second)
        elsif value['range'] == "PREV_YEAR"
          from_value = Time.today.last_year.beginning_of_year
          to_value = Time.today.beginning_of_year.ago(1.second)
        elsif value['range'] == "CUSTOM"
          from_value = (value['from'].blank?)? Date.today : value['from']
          to_value = (value['to'].blank?)? Date.today : value['to']
        elsif value['range'] == "TREND"
          trend_number = [value['number'].to_i,  1].max
          from_value = eval("#{trend_number - 1}.#{value['unit']}.ago.beginning_of_#{value['unit']}") 
          to_value = Date.today
        end

        if !from_value
          ["#{column.search_sql} <= ?", to_value.to_date.to_s(:db)]
        elsif !to_value
          ["#{column.search_sql} >= ?", from_value.to_date.to_s(:db)]
        else
          ["#{column.search_sql} BETWEEN ? AND ?", from_value.to_date.to_s(:db), to_value.to_date.to_s(:db)]
        end                

        else
        ["LOWER(#{column.search_sql}) LIKE ?", like_pattern.sub('?', value.downcase)]
      end
    end
  end
end
