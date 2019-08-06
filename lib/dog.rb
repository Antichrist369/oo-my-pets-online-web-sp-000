class Dog
  class << self
    @all = []
    attr_reader :all
    
    def new(name, owner)
      pet = super(name, owner)
      @all << pet
      pet
    end
    
    def with_owner(owner)
      @all.select { |pet| pet.owner == owner }
    end
  end
  
  attr_reader :name, :mood, :owner
  
  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
    @owner = owner
  end 
  
  def sell
    @mood = 'nervous'
    @owner.pets[:dogs].delete(self)
    @owner = nil
  end
  
  def walk
    @mood = 'happy'
  end
end
