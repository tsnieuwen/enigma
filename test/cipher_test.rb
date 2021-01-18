require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_exists
    cipher = Cipher.new('12487')
    assert_instance_of Cipher, cipher
  end

  def test_it_has_readable_attributes
    cipher = Cipher.new('12487')
    assert_equal 12487, cipher.key_to_integer
    assert_nil cipher.a_shift
    assert_nil cipher.b_shift
    assert_nil cipher.c_shift
    assert_nil cipher.d_shift
  end

  def test_keys
    cipher = Cipher.new('12487')
    assert_equal 12, cipher.a_key
    assert_equal 24, cipher.b_key
    assert_equal 48, cipher.c_key
    assert_equal 87, cipher.d_key
  end

end
