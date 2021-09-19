# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WindDirection.destroy_all
WeatherType.destroy_all
City.destroy_all

WindDirection.create!(name: 'Nord')
WindDirection.create!(name: 'Nord Est')
WindDirection.create!(name: 'Est')
WindDirection.create!(name: 'Sud Est')
WindDirection.create!(name: 'Sud')
WindDirection.create!(name: 'Sud Ouest')
WindDirection.create!(name: 'Ouest')
WindDirection.create!(name: 'Nord Ouest')
WindDirection.create!(name: 'Nord')

WeatherType.create!(name: 'Très ensoleillé')
WeatherType.create!(name: 'Ensoleillé')
WeatherType.create!(name: 'Eclaircies')
WeatherType.create!(name: 'Ciel voilé')
WeatherType.create!(name: 'Couvert')
WeatherType.create!(name: 'Nuageux')
WeatherType.create!(name: 'Peu nuageux')
WeatherType.create!(name: 'Très nuageux')
WeatherType.create!(name: 'Bruine')
WeatherType.create!(name: 'Averses')
WeatherType.create!(name: 'Rares averses')
WeatherType.create!(name: 'Pluies éparses')
WeatherType.create!(name: 'Giboulées')
WeatherType.create!(name: 'Pluie intense')
WeatherType.create!(name: 'Pluie torrentielle')
WeatherType.create!(name: 'Orage')
WeatherType.create!(name: 'Pluies acides')
WeatherType.create!(name: 'Pluies de cendres')
WeatherType.create!(name: 'Neige')
WeatherType.create!(name: 'Tempête de neige')
WeatherType.create!(name: 'Brouillard')
WeatherType.create!(name: 'Grêle')
WeatherType.create!(name: 'Tornade')
WeatherType.create!(name: 'Cyclone')
WeatherType.create!(name: 'Ouragan')
WeatherType.create!(name: 'Tempête de sable')
WeatherType.create!(name: 'Brise légère')
WeatherType.create!(name: 'Vent')
WeatherType.create!(name: 'Vents violents')

City.create(name: 'Paris', longitude: 2.347, latitude: 48.859, country: 'France', region: 'Île-de-France', department: 'Paris')
City.create(name: 'Toulouse', longitude: 1.434497, latitude: 43.603746, country: 'France', region: 'Occitanie', department: 'Haute-Garonne')
City.create(name: 'Marseille', longitude: 5.405, latitude: 43.282, country: 'France', region: "Provence-Alpes-Côte d'Azur", department: 'Bouches-du-Rhône')
City.create(name: 'Gruissan', longitude: 3.102981, latitude: 43.115546, country: 'France', region: 'Occitanie', department: 'Aude')
