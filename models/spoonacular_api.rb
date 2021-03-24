class SpoonacularApi

  def self.get_recipes
    HTTParty.get('https://api.spoonacular.com/recipes/complexSearch?apiKey=d4e53c6445044db48e3dc014af376cc9').parsed_response['results']
    binding.pry
  end


  def self.get_recipe(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/information?apiKey=d4e53c6445044db48e3dc014af376cc9")
  end

  def self.search_recipes_by_ingredients(ingredients)
    ingredient_params = ingredients.split(",").join(',+')
    binding.pry
    HTTParty.get("https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient_params}&apiKey=d4e53c6445044db48e3dc014af376cc9").parsed_response
  end

  def self.get_recipe_with_instruction(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/analyzedInstructions?apiKey=d4e53c6445044db48e3dc014af376cc9").parsed_response[0]["steps"]
  end

  def self.find_similar_recipe_by_id(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/similar?apiKey=d4e53c6445044db48e3dc014af376cc9").parsed_response
  end
end