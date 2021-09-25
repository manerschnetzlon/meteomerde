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
WeatherType.create!(name: 'Brouillard', weight: 6, temp_max: 10)
WeatherType.create!(name: 'Bruine', weight: 5)
WeatherType.create!(name: 'Orage', weight: 4, temp_min: 27)
WeatherType.create!(name: 'Pluie intense', weight: 4)
WeatherType.create!(name: 'Grêle', weight: 3, temp_max: 10)
WeatherType.create!(name: 'Neige', weight: 3, temp_max: 1)
WeatherType.create!(name: 'Vents violents', weight: 3)
WeatherType.create!(name: 'Pluie torrentielle', weight: 2)
WeatherType.create!(name: 'Giboulées', weight: 2, temp_max: 12)
WeatherType.create!(name: 'Tempête de neige', weight: 2, temp_max: -1)
WeatherType.create!(name: 'Pluies acides', weight: 1, temp_min: 32)
WeatherType.create!(name: 'Pluies de cendres', weight: 1, temp_min: 30)
WeatherType.create!(name: 'Tornade', weight: 1)
WeatherType.create!(name: 'Cyclone', weight: 1, temp_min: 29)
WeatherType.create!(name: 'Ouragan', weight: 1, temp_min: 29)
WeatherType.create!(name: 'Tempête de sable', weight: 1, temp_min: 30)
