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
        self.all.find{|recipe| recipe.title == title}
    end
    
    def print_details
        puts "Id: #{self.id}, Title: #{self.title}, Image: #{self.image}"
    end

    def self.print_more_details(detail_hash)
        all_ingredients = detail_hash['extendedIngredients'].map { |i| i['name'] }.join(', ')
        puts "Vegetarian: #{detail_hash['vegetarian']}. All Ingredients: #{all_ingredients}. Summary: #{detail_hash['summary']}"
    end
end