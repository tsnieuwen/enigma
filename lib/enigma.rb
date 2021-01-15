class Enigma
  attr_reader :message,
              :key,
              :date,
              :character_set

  def initialize(message, key, date)
    @message = message
    @key = key.to_i
    @date = date.to_i
    @character_set = ("a".."z").to_a << " "
  end

  def a_key
  end

  def b_key
  end

  def c_key
  end

  def d_key
  end 

end
