class SpoonacularApi

  def self.get_recipes
    HTTParty.get('https://api.spoonacular.com/recipes/complexSearch?apiKey=d4e53c6445044db48e3dc014af376cc9').parsed_response['results']
  end

  def self.get_recipe(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/information?apiKey=d4e53c6445044db48e3dc014af376cc9")
  end

  def self.search_recipes_by_ingredients(ingredients)
    ingredient_params = ingredients.split(",").join(',+')

    HTTParty.get("https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient_params}&apiKey=d4e53c6445044db48e3dc014af376cc9").parsed_response
  end
end