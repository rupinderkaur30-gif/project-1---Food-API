class CLI
    
def initialize
    set_recipes
    @prompt = TTY::Prompt.new
    welcome
    menu
end

def set_recipes
    SpoonacularApi.new.response.each{|recipe_hash| Recipe.new(recipe_hash)}
end

def welcome
    puts "welcome to find recipe"
end

def menu
    if @user
      input = @prompt.enum_select("What would you like to do, #{@user.username}?", ["find recipe", "Logout", "Exit"])
      case input
      when "find recipe"
       find_recipe
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

  def find_recipe
    puts "please enter ingredient"

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
    puts "Thanks for helping our Breaking Bad Besties get Back on their Feet"
  end
end