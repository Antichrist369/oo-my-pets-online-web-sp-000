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
    Cat.with_owner(self)
  end 
  
  def dogs 
    Dog.with_owner(self)
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
    dogs.each(&:walk)
  end 
  
  def feed_cats 
    cats.each(&:feed)
  end 
  
  def each_pet(type = nil, &block)
    @pets.each do |category, pets_in_category|
      next unless type.nil? || type == category
      pets_in_category.each(&block)
    end
  end
  
  
  def sell_pets 
    pets.each(&:sell)
  end 
  
  
  def list_pets 
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
  
  def self.count 
    @@all.size 
  end 
  
  def self.reset_all 
    @@all.clear 
  end 

end 

