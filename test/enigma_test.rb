require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/encrypter'
require './lib/decrypter'
require './lib/cipher'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.character_set
  end

  def test_encrypt
    enigma = Enigma.new
    expected = {encryption: "dvwysjak pwdfjii",
                key: "12487",
                date: "120395"
                }
    assert_equal expected, enigma.encrypt("my name is tommy", "12487", "120395")
  end

  def test_decrypt
    enigma = Enigma.new
    expected = {decryption: "my name is tommy",
                key: "12487",
                date: "120395"
                }
    assert_equal expected, enigma.decrypt("dvwysjak pwdfjii", "12487", "120395")
  end

end
