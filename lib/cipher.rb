class Cipher
  attr_reader :key_string,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift

  def initialize(key_string)
    @key_string = key_string
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

end
