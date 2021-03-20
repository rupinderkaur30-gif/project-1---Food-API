require 'bundler'
Bundler.require

require 'open-uri'
require 'net/http'
require 'json'

require_relative "../models/cli.rb"
require_relative "../models/user.rb"
require_relative "../models/recipe.rb"
require_relative "../models/spoonacular_api.rb"



# "puts"welcome to find recipe"
# puts "please enter ingredients you want to search for recipes"
# ingredients = gets.chomp


# url =  'https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=10&apiKey=d4e53c6445044db48e3dc014af376cc9'


# uri = URI.parse(url)
# response = Net::HTTP.get(uri)
# json = JSON.parse(response)
# puts json

#  recipe_url = 'https://api.spoonacular.com/recipes/47950/information?apiKey=d4e53c6445044db48e3dc014af376cc9'
# recipe_uri = URI.parse(recipe_url)
# response = Net::HTTP.get(recipe_uri)
# json = JSON.parse(response)
# puts json


# json["extendedIngredients"].map {|i| i["name"]}
# binding.pry

