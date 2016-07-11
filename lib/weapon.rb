class Weapon
  attr_accessor :picked_up

  def initialize(name,damage=nil)
    @name = name
    @damage = damage
    @bot = nil
  end

  def bot
    @bot
  end

  def bot=(bot)
    @bot = bot
  end

  def damage
    @damage
  end

end