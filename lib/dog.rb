class Dog
  
  attr_accessor :mood, :owner
  attr_reader :name 
  @@all = [] 
  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
    @@all << self 
    @owner = owner
    @owner.pets[:dogs] << self
  end 
  
  def self.all 
    @@all 
  end 
  
  def sell
    @mood = 'nervous'
    @owner.pets[:dogs].delete(self)
    @owner = nil
  end
end
