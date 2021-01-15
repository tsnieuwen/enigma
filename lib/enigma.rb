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
    (@key.digits.reverse[0].to_s + @key.digits.reverse[1].to_s).to_i
  end

  def b_key
    (@key.digits.reverse[1].to_s + @key.digits.reverse[2].to_s).to_i
  end

  def c_key
    (@key.digits.reverse[2].to_s + @key.digits.reverse[3].to_s).to_i
  end

  def d_key
    (@key.digits.reverse[3].to_s + @key.digits.reverse[4].to_s).to_i
  end

end
