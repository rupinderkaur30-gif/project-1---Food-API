class SpoonacularApi

  def self.get_recipes
    HTTParty.get('https://api.spoonacular.com/recipes/complexSearch?apiKey=262f4fa746dc433eb5fabdbddf704bb4').parsed_response['results']
   
  end


  def self.get_recipe(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/information?apiKey=262f4fa746dc433eb5fabdbddf704bb4").parsed_response
  end

  def self.search_recipes_by_ingredients(ingredients)
    ingredient_params = ingredients.split(",").join(',+')
    HTTParty.get("https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient_params}&apiKey=262f4fa746dc433eb5fabdbddf704bb4").parsed_response
  end

  def self.get_recipe_with_instruction(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/analyzedInstructions?apiKey=262f4fa746dc433eb5fabdbddf704bb4").parsed_response[0]["steps"]
  end

  def self.find_similar_recipe_by_id(id)
    HTTParty.get("https://api.spoonacular.com/recipes/#{id}/similar?apiKey=262f4fa746dc433eb5fabdbddf704bb4").parsed_response
  end

end