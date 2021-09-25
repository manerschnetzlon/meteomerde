class TemperatureRecord < ApplicationRecord
  belongs_to :department
end

def load_temperature_records_csv
  csv_options = { headers: :first_row, header_converters: :symbol }

  month = '01'
  month_record = {
    temp_min: [],
    temp_max: [],
    temp_average: []
  }

  CSV.foreach('db/temperature_records.csv', csv_options) do |row|
    month_record[:num] = row[:num].to_i
    month_record[:name] = row[:name]
    if month <= '12'
      if row[:date].match?(/^2019-#{month}/)
        month_record[:month] = month.to_i
        month_record[:temp_min] << row[:min].to_f.round
        month_record[:temp_max] << row[:max].to_f.round
        month_record[:temp_average] << row[:average].to_f.round
      else
        unless Department.exists?(num: month_record[:num])
          Department.create!(name: month_record[:name], num: month_record[:num])
        end
        temp_min = month_record[:temp_min].sum / month_record[:temp_min].length
        temp_max = month_record[:temp_max].sum / month_record[:temp_max].length
        temp_average = month_record[:temp_average].sum / month_record[:temp_average].length
        TemperatureRecord.create!(month: month_record[:month], temp_min: temp_min, temp_max: temp_max, temp_average: temp_average)

        month += 1
      end
    else
      month = '01'
    end
  end
end
