class SearchIngredients
    attr_reader :ingredients , :recipe

    def initialize(ingredients)
        search(ingredients)
    end

    def search(ingredients)
        url =  "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredients}&number=10&apiKey=d4e53c6445044db48e3dc014af376cc9"


       uri = URI.parse(url)
       response = Net::HTTP.get(uri)
       json = JSON.parse(response)
    #    @ingredients = json["extendedIngredients"]
    
       
    end

    # def search_recipes_by_ingredients(ingredients)
    #     recipe_url = "https://api.spoonacular.com/#{recipes}/47950/information?apiKey=d4e53c6445044db48e3dc014af376cc9"
    #     recipe_uri = URI.parse(recipe_url)
    #     response = Net::HTTP.get(recipe_uri)
    #     json = JSON.parse(response)
    #     @recipe = json["title"]
    # end
end