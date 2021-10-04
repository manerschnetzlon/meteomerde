# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
WeatherPrevision.destroy_all
WeatherType.destroy_all
Department.destroy_all
TemperatureRecord.destroy_all

puts 'Start creating Weather Types'

WeatherType.create!(name: 'Très ensoleillé', weight: 10)
WeatherType.create!(name: 'Ensoleillé', weight: 15)
WeatherType.create!(name: 'Eclaircies', weight: 15)
WeatherType.create!(name: 'Ciel voilé', weight: 15)
WeatherType.create!(name: 'Couvert', weight: 15)
WeatherType.create!(name: 'Nuageux', weight: 15)
WeatherType.create!(name: 'Peu nuageux', weight: 15)
WeatherType.create!(name: 'Pluies éparses', weight: 12)
WeatherType.create!(name: 'Vent', weight: 12)
WeatherType.create!(name: 'Très nuageux', weight: 10)
WeatherType.create!(name: 'Brise légère', weight: 8)
WeatherType.create!(name: 'Averses', weight: 8)
WeatherType.create!(name: 'Rares averses', weight: 7)
WeatherType.create!(name: 'Brouillard', weight: 6, temperature_max: 10)
WeatherType.create!(name: 'Bruine', weight: 5, temperature_max: 12)
WeatherType.create!(name: 'Orage', weight: 4, temperature_min: 27)
WeatherType.create!(name: 'Pluie intense', weight: 4)
WeatherType.create!(name: 'Grêle', weight: 3, temperature_max: 10)
WeatherType.create!(name: 'Neige', weight: 3, temperature_max: 1)
WeatherType.create!(name: 'Vents violents', weight: 3)
WeatherType.create!(name: 'Pluie torrentielle', weight: 2)
WeatherType.create!(name: 'Giboulées', weight: 2, temperature_max: 12)
WeatherType.create!(name: 'Tempête de neige', weight: 2, temperature_max: -1)
WeatherType.create!(name: 'Pluies acides', weight: 1, temperature_min: 32)
WeatherType.create!(name: 'Pluies de cendres', weight: 1, temperature_min: 30)
WeatherType.create!(name: 'Tornade', weight: 1, temperature_min: 29)
WeatherType.create!(name: 'Cyclone', weight: 1, temperature_min: 29)
WeatherType.create!(name: 'Ouragan', weight: 1, temperature_min: 29)
WeatherType.create!(name: 'Tempête de sable', weight: 1, temperature_min: 30)

puts 'Weather Types created !'

require 'csv'
csv_options = { headers: :first_row, header_converters: :symbol }
data_hash = {}
pattern = /2019-(?<month>\d{2})-/

puts 'Start reading the CSV file'

puts 'Building hash'
CSV.foreach('db/temperature_records.csv', csv_options) do |row|
  month = row[:date].match(pattern)[:month]

  if data_hash[row[:num]].nil?
    data_hash[row[:num]] = { name: row[:name], months: {} }
  end
  if data_hash[row[:num]][:months][month].nil?
    data_hash[row[:num]][:months][month] = { temp_min: [],
                                             temp_max: [],
                                             temp_average: [] }
  end
  data_hash[row[:num]][:months][month][:temp_min] << row[:min].to_i.round
  data_hash[row[:num]][:months][month][:temp_max] << row[:max].to_i.round
  data_hash[row[:num]][:months][month][:temp_average] << row[:average].to_i.round
end
puts 'Hash built'

data_hash.each do |key, value|
  if Department.exists?(number: key.to_i)
    department = Department.find_by(number: key.to_i)
  else
    department = Department.create!(name: value[:name], number: key.to_i)
    puts "#{value[:name]} departement created !"
  end

  value[:months].each do |key2, value2|
    next if TemperatureRecord.exists?(month: key2.to_i, department: department)

    temp_min = value2[:temp_min].sum / value2[:temp_min].length
    temp_max = value2[:temp_max].sum / value2[:temp_max].length
    temp_average = value2[:temp_average].sum / value2[:temp_average].length
    TemperatureRecord.create!(month: key2.to_i, temp_min: temp_min, temp_max: temp_max, temp_average: temp_average, department: department)
    puts "Temperature record for #{Department.find_by(number: key.to_i).name} and month #{key2.to_i} created !"
  end
end

puts 'CSV file loaded !'
