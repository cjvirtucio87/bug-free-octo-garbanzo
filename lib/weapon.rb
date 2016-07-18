class Weapon
  attr_accessor :picked_up
  attr_reader :name

  def initialize(name,damage=0)
    case
    when !name.is_a?(String), !damage.is_a?(Fixnum)
      raise ArgumentError
    end
    @name = name
    @damage = damage
    @bot = nil
    @picked_up = false
  end

  def bot
    @bot
  end

  def bot=(bot)
    if bot
      raise ArgumentError if !bot.is_a?(BattleBot)
    end
    @bot = bot
  end

  def damage
    @damage
  end

  def picked_up?
    @picked_up
  end

end