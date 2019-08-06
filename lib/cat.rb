class Cat
  
  attr_accessor :mood, :owner
  attr_reader :name
  @@all = []
  
  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
    @@all << self
    @owner = owner
<<<<<<< HEAD
    @owner.pets[:cats] << self
=======
>>>>>>> 4a73c2dfeab5d76cfe66a5875ad1dc8a18f9fd87
  end
  
  def self.all 
    @@all
  end 
  
  def sell
    @mood = 'nervous'
    @owner.pets[:cats].delete(self)
    @owner = nil
  end
end
