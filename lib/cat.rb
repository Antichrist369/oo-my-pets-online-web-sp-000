class Cat
  attr_reader :name, :mood, :owner
  
  class << self
      def all
      @all ||= [] # same as @all = @all || []
    end
    
    def new(name, owner)
      pet = super(name, owner)
      all << pet
      pet
    end
    
    def with_owner(owner)
      all.select { |pet| pet.owner == owner }
    end
  end
  
  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
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
