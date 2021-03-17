class SearchIngredients

    def search(ingredients)
        url =  "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredients}&number=10&apiKey=d4e53c6445044db48e3dc014af376cc9"


       uri = URI.parse(url)
       response = Net::HTTP.get(uri)
       json = JSON.parse(response)
       json.map {|r| r["title"]}
    end
end