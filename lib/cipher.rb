class Cipher
  attr_reader :key_to_integer,
              :date_to_integer,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift

  def initialize(key_string, date_string)
    @key_to_integer = key_string.to_i
    @date_to_integer = date_string.to_i
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

  def a_key
    (@key_to_integer.digits.reverse[0].to_s + @key_to_integer.digits.reverse[1].to_s).to_i
  end

  def b_key
    (@key_to_integer.digits.reverse[1].to_s + @key_to_integer.digits.reverse[2].to_s).to_i
  end

  def c_key
    (@key_to_integer.digits.reverse[2].to_s + @key_to_integer.digits.reverse[3].to_s).to_i
  end

  def d_key
    (@key_to_integer.digits.reverse[3].to_s + @key_to_integer.digits.reverse[4].to_s).to_i
  end

  def date_squared
    @date_to_integer ** 2
  end

  def a_offset
    date_squared.digits.reverse[-4]
  end

  def b_offset
    date_squared.digits.reverse[-3]
  end

  def c_offset
    date_squared.digits.reverse[-2]
  end

  def d_offset
    date_squared.digits.reverse[-1]
  end

end
