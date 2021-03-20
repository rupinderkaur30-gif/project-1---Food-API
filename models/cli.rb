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
    puts "welcome to find recipe"
end

def menu
    if @user
      input = @prompt.enum_select("What would you like to do, #{@user.username}?", ["see recipe", "Find Recipe by Ingredient", "Logout", "Exit"])
      case input
      when "see recipe"
       see_recipe
      when "Find Recipe by Ingredient"
        find_recipe_by_ingredients
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
        Recipe.print_more_details(recipe_hash)
    
    end
  end

  def see_recipe
    Recipe.all.each do |recipe|
        puts recipe.print_details
        puts ""
    end
    puts "please enter the id of the recipe to get more info"
    id = gets.chomp.to_i
    recipe_hash = SpoonacularApi.get_recipe(id)
    Recipe.print_more_details(recipe_hash)
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