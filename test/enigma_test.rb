require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("my name is tommy", "12487", "120395")
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes
    enigma = Enigma.new("my name is tommy", "12487", "120395")
    assert_equal 'my name is tommy', enigma.message
    assert_equal 12487, enigma.key
    assert_equal 120395, enigma.date
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.character_set
  end

  def test_keys
    enigma = Enigma.new("my name is tommy", "12487", "120395")
    assert_equal 12, enigma.a_key
    assert_equal 24, enigma.b_key
    assert_equal 48, enigma.c_key
    assert_equal 87, enigma.d_key
  end
  
end
