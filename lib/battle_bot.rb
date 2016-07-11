class BattleBot
  attr_reader :name, :health, :enemies

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @dead = false
    @enemies = []
  end

  def dead?
    @dead = (@health <= 0)
  end

  def take_damage(num)
    raise ArgumentError if !(num.is_a?(Fixnum))
    @health -= num
    @health = 0 if @health < 0
    @health
  end

  def heal
    if (@health < 100) && (@health > 0) && !@dead
      @health += 10
    end
  end

  def attack(bot)
    case
    when !bot.is_a?(BattleBot), (bot.object_id == object_id), @weapon.nil?
      raise ArgumentError
    end
    bot.send(:receive_attack_from,self)
  end

  def receive_attack_from(bot)
    case
    when !bot.is_a?(BattleBot), (bot.object_id == object_id), bot.weapon.nil?
      raise ArgumentError
    end
    @enemies.push(bot) unless @enemies.include?(bot)
    defend_against(bot)
    take_damage(bot.weapon.damage)
  end

  def defend_against(bot)
    if !(self.dead?) && self.has_weapon? && (bot.object_id != self.object_id)
      attack(bot)
    end
  end

  def has_weapon?
    !@weapon.nil?
  end

  def weapon
    @weapon
  end

  def pick_up(weapon)
    case
    when !(weapon.is_a?(Weapon)), weapon.picked_up
      raise ArgumentError
    when @weapon.nil?
      weapon.picked_up = true
      weapon.bot = self
      @weapon = weapon
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

end