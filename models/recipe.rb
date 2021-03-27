class Recipe

    attr_reader :id, :title, :image
    
    @@all = []
    
    def initialize(hash)
        @id = hash["id"]
        @title = hash["title"]
        @image = hash["image"]
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def self.find_by_title(title)
        binding.pry
        self.all.find{|recipe| recipe.title == title}
    end
    
    def print_details
        puts "Id: #{self.id}, Title: #{self.title}, Image: #{self.image}"
    end

    def self.print_more_details(detail_hash)
        all_ingredients = detail_hash['extendedIngredients'].map {|i| i['name'] }.join(', ') 
        puts "Vegetarian: #{detail_hash['vegetarian']}"
        puts  "All Ingredients: #{all_ingredients}"
        puts  "Summary: #{detail_hash['summary']}"

    end

    def self.print_instruction_details(steps_array)
        steps_array.each_with_index {|step_hash, index| puts  "Step #{index+1}. #{step_hash['step']}"}
    end

    def self.print_similar_recipes(similar_recipe_array)
        similar_recipe_array.each  {|similar_recipe_array| puts "Similar_recipe: #{similar_recipe_array['title']}", "Similar_recipe_url:#{similar_recipe_array['sourceUrl']}"} 
    end


end