# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# Ingredient.destroy_all
require "open-uri"
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
read = open(url).read
hash = JSON.parse(read)
#  Quando abrimos a url, o "drinks" eh o nome da table, e ai puxamos o conteudo

hash['drinks'].each do |key|
  ing = Ingredient.new
  ing.name = key['strIngredient1']
  ing.save
end

10.times do
  cocktail = Cocktail.new
  cocktail.name = Faker::Ancient.primordial
  cocktail.save
end
