class SpoonacularApi
    
  attr_reader :response

  def initialize
    @response = HTTParty.get('https://api.spoonacular.com/recipes/complexSearch?apiKey=d4e53c6445044db48e3dc014af376cc9').parsed_response['results']
  end
end