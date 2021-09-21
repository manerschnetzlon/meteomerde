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
WindDirection.destroy_all

WindDirection.create!(name: 'Nord')
WindDirection.create!(name: 'Nord Est')
WindDirection.create!(name: 'Est')
WindDirection.create!(name: 'Sud Est')
WindDirection.create!(name: 'Sud')
WindDirection.create!(name: 'Sud Ouest')
WindDirection.create!(name: 'Ouest')
WindDirection.create!(name: 'Nord Ouest')
WindDirection.create!(name: 'Nord')

WeatherType.create!(name: 'Très ensoleillé', weight: 10, temp: 6)
WeatherType.create!(name: 'Ensoleillé', weight: 15, temp: 4)
WeatherType.create!(name: 'Eclaircies', weight: 15, temp: 3)
WeatherType.create!(name: 'Ciel voilé', weight: 15)
WeatherType.create!(name: 'Couvert', weight: 15, temp: 1)
WeatherType.create!(name: 'Nuageux', weight: 15, temp: -1)
WeatherType.create!(name: 'Peu nuageux', weight: 15)
WeatherType.create!(name: 'Pluies éparses', weight: 12, temp: -1)
WeatherType.create!(name: 'Vent', weight: 12, temp: 1)
WeatherType.create!(name: 'Très nuageux', weight: 10, temp: -2)
WeatherType.create!(name: 'Brise légère', weight: 8)
WeatherType.create!(name: 'Averses', weight: 8, temp: -2)
WeatherType.create!(name: 'Rares averses', weight: 7, temp: -2)
WeatherType.create!(name: 'Brouillard', weight: 6, temp: -4)
WeatherType.create!(name: 'Bruine', weight: 5, temp: -2)
WeatherType.create!(name: 'Orage', weight: 4, temp: -2)
WeatherType.create!(name: 'Pluie intense', weight: 4, temp: -2)
WeatherType.create!(name: 'Grêle', weight: 3, temp: -5)
WeatherType.create!(name: 'Neige', weight: 3, temp: -10)
WeatherType.create!(name: 'Vents violents', weight: 3, temp: -2)
WeatherType.create!(name: 'Pluie torrentielle', weight: 2, temp: -3)
WeatherType.create!(name: 'Giboulées', weight: 2, temp: -3)
WeatherType.create!(name: 'Tempête de neige', weight: 2, temp: -8)
WeatherType.create!(name: 'Pluies acides', weight: 1)
WeatherType.create!(name: 'Pluies de cendres', weight: 1, temp: 5)
WeatherType.create!(name: 'Tornade', weight: 1, temp: -2)
WeatherType.create!(name: 'Cyclone', weight: 1, temp: -2)
WeatherType.create!(name: 'Ouragan', weight: 1, temp: -2)
WeatherType.create!(name: 'Tempête de sable', weight: 1, temp: 3)

# City.create(name: 'Paris', longitude: 2.347, latitude: 48.859, country: 'France', region: 'Île-de-France', department: 'Paris')
# City.create(name: 'Toulouse', longitude: 1.434497, latitude: 43.603746, country: 'France', region: 'Occitanie', department: 'Haute-Garonne')
# City.create(name: 'Marseille', longitude: 5.405, latitude: 43.282, country: 'France', region: "Provence-Alpes-Côte d'Azur", department: 'Bouches-du-Rhône')
# City.create(name: 'Gruissan', longitude: 3.102981, latitude: 43.115546, country: 'France', region: 'Occitanie', department: 'Aude')
