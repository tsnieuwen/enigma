# require 'simplecov'
# SimpleCov.start
# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/enigma'
# require './lib/cipher'

require './test/test_helper'

class CipherTest < Minitest::Test

  def test_it_exists
    cipher = Cipher.new('12487', '120395')
    assert_instance_of Cipher, cipher
  end

  def test_it_has_readable_attributes
    cipher = Cipher.new('12487', '120395')
    assert_equal 12487, cipher.key_to_integer
    assert_equal 120395, cipher.date_to_integer
    assert_equal 18, cipher.a_shift
    assert_equal 24, cipher.b_shift
    assert_equal 50, cipher.c_shift
    assert_equal 92, cipher.d_shift
  end

  def test_keys
    cipher = Cipher.new('12487', '120395')
    assert_equal 12, cipher.a_key
    assert_equal 24, cipher.b_key
    assert_equal 48, cipher.c_key
    assert_equal 87, cipher.d_key
  end

  def test_offsets
    cipher = Cipher.new('12487', '120395')
    assert_equal 14494956025, cipher.date_squared
    assert_equal 6, cipher.a_offset
    assert_equal 0, cipher.b_offset
    assert_equal 2, cipher.c_offset
    assert_equal 5, cipher.d_offset
  end

  def test_shifts
    cipher = Cipher.new('12487', '120395')
    assert_equal 18, cipher.a_shift
    assert_equal 24, cipher.b_shift
    assert_equal 50, cipher.c_shift
    assert_equal 92, cipher.d_shift
  end

end
