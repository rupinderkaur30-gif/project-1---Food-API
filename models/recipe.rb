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
        puts self.id
        puts "Title: #{self.title}"
        puts "Image: #{self.image}"
    end
end