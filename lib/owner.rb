require  'pry'
require_relative './cat'
require_relative './dog'
class Owner
  @@all = [] 
  
  attr_reader :name, :species, :pets
  
  def initialize(name)
    @species = "human" 
    @@all << self 
    @name = name
  end 
  
  def cats 
    Cat.all.select do |cat| 
      cat.owner == self 
    end 
  end 
  
  def dogs 
    Dog.all.select do |dog| 
      dog.owner == self 
    end 
  end 
  
  def pets
    cats + dogs
  end
  
  
  def self.all 
    @@all 
  end 
  
  def say_species 
    "I am a #{@species}."
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end 
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def walk_dogs 
    @pets[:dogs].each  {|dog| dog.mood = "happy"} 
  end 
  
  def feed_cats 
    # each_pet(:cats, &:feed)
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end 
  
  def each_pet(type = nil, &block)
    @pets.each do |category, pets_in_category|
      next unless type.nil? || type == category
      pets_in_category.each(&block)
    end
  end
  
  
  def sell_pets 
    # each_pet(&:sell)
    @pets.each do |type, pets_of_type|
      pets_of_type.each(&:sell)
    end
  end 
  
  
  def list_pets 
    num_dogs = pets[:dogs].size 
    num_cats = pets[:cats].size
    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end
  
  def self.count 
    @@all.size 
  end 
  
  def self.reset_all 
    @@all.clear 
  end 

end 

