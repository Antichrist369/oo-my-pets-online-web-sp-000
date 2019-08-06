require_relative './pet'
class Dog < Pet
  def walk
    @mood = 'happy'
  end
end
