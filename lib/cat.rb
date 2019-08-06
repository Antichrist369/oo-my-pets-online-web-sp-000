class Cat
  
  attr_accessor :mood, :owner
  attr_reader :name
  
  class << self
    @all = []
    attr_reader :all
    
    def new(*args)
      pet = super(*args)
      @all << pet
      pet
    end
  end
  
  
  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
    @@all << self
    @owner = owner
  end
  
  def sell
    @mood = 'nervous'
    @owner = nil
  end
  
  def feed 
    @mood = 'happy'
  end
end
