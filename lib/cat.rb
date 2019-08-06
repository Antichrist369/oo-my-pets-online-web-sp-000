require_relative './pet'
class Cat < Pet
  def feed 
    @mood = 'happy'
  end
end
