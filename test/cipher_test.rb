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
    assert_equal '12487', cipher.key_string
    assert_nil cipher.a_shift
    assert_nil cipher.b_shift
    assert_nil cipher.c_shift
    assert_nil cipher.d_shift
  end

end
