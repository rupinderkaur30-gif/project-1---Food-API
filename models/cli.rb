class CLI
    
def initialize
    set_recipes
    @prompt = TTY::Prompt.new
    welcome
    menu
end

def set_recipes
    SpoonacularApi.get_recipes.each{|recipe_hash| Recipe.new(recipe_hash)}
end

def welcome
    puts "...........Welcome to Find Recipe............."
end

def menu
    if @user
      input = @prompt.select("What would you like to do, #{@user.username}?", ["See Recipe", "Find Recipe by Ingredient", "Get Recipe with Instruction","Find similar Recipe by Id" , 
        "Logout", "Exit"])
      case input
      when "See Recipe"
       see_recipe
      when "Find Recipe by Ingredient"
        find_recipe_by_ingredients
      when "Get Recipe with Instruction"
        get_recipe_with_instruction
      when "Find similar Recipe by Id"
        find_similar_recipe_by_id
      when "Find Recipe by Nutrients"
        find_recipe_by_nutrients
      when "Logout"
        logout
      when "Exit"
        exit_app
      end
    else
      prompt_login
      menu
    end
  end

  def find_recipe_by_ingredients
    puts "please enter ingredients separated by comma"
    ingredients = gets.chomp
    response = SpoonacularApi.search_recipes_by_ingredients(ingredients)
    response.each do |recipe|
    recipe_hash = SpoonacularApi.get_recipe(recipe['id'])
    id = gets.chomp.to_i
    puts "........."
    puts "Recipe_name: #{recipe_hash["title"]}"
    puts "Ready_in_minutes: #{recipe_hash["readyInMinutes"]}"
    puts "Servings: #{recipe_hash["servings"]}"
    Recipe.print_more_details(recipe_hash)
    end
    menu
  end

  def see_recipe
    Recipe.all.each do |recipe|
        puts recipe.print_details
        puts ""
    end
    puts "please enter the id of the recipe to get more info"
    id = gets.chomp.to_i
    recipe_hash = SpoonacularApi.get_recipe(id)
    puts "Recipe_name: #{recipe_hash["title"]}"
    puts "Ready_in_minutes: #{recipe_hash["readyInMinutes"]}"
    puts "Servings: #{recipe_hash["servings"]}"
    Recipe.print_more_details(recipe_hash)
    menu
  end

  def get_recipe_with_instruction
    puts "please enter the id of the recipe to get instruction for the recipe"
    id = gets.chomp.to_i
    recipe_steps = SpoonacularApi.get_recipe_with_instruction(id)
    recipe_hash = SpoonacularApi.get_recipe(id)
    puts "Recipe_name: #{recipe_hash["title"]}"
    Recipe.print_instruction_details(recipe_steps)
    menu
  end

  def find_similar_recipe_by_id
    puts "please enter the id of the recipe to get similar recipe"
    id = gets.chomp.to_i
    similar_recipes_array = SpoonacularApi.find_similar_recipe_by_id(id)
    recipe_hash = SpoonacularApi.get_recipe(id)
    puts "Recipe_name: #{recipe_hash["title"]}"
    Recipe.print_similar_recipes(similar_recipes_array)
    menu
  end
    
  def prompt_login
    username = @prompt.ask("What's your username?")
    @user = User.find_or_create(username)
  end

  def logout
    @user = nil
    menu
  end
  
  def exit_app
    puts "Thanks for searching recipes"
  end
end