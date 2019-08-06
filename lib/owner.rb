require  'pry'
require_relative './cat'
require_relative './dog'
class Owner
  class << self
    def all
      @all ||= [] # same as @all = @all || []
    end
    
    def new(name)
      owner = super(name)
      all << owner
      owner
    end
  
    def count 
      all.size 
    end 
    
    def reset_all 
      all.clear 
    end 
  end
  
  attr_reader :name, :species, :pets
  
  def initialize(name)
    @name = name
    @species = 'human'
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
  
  def sell_pets 
    pets.each(&:sell)
  end
  
  def list_pets 
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
  
end 

