class Cipher
  attr_reader :five_digit_key_array,
              :date_to_integer,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift

  def initialize(key_string, date_string)
    @five_digit_key_array = (key_string.rjust(5, "0")).split("")
    @date_to_integer = date_string.to_i
    @a_shift = a_shift
    @b_shift = b_shift
    @c_shift = c_shift
    @d_shift = d_shift
  end

  def a_key
    (@five_digit_key_array[0] + @five_digit_key_array[1]).to_i
  end

  def b_key
    (@five_digit_key_array[1] + @five_digit_key_array[2]).to_i
  end

  def c_key
    (@five_digit_key_array[2] + @five_digit_key_array[3]).to_i
  end

  def d_key
    (@five_digit_key_array[3] + @five_digit_key_array[4]).to_i
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

  def a_shift
    a_key + a_offset
  end

  def b_shift
    b_key + b_offset
  end

  def c_shift
    c_key + c_offset
  end

  def d_shift
    d_key + d_offset
  end

end
