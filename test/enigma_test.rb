require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/encrypter'
require './lib/decrypter'
require './lib/cipher'
require './lib/cryptable'


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes
    enigma = Enigma.new
    enigma.encrypt("my name is tommy", "12487", "120395")
    enigma.decrypt("dvwysjak pwdfjii", "12487", "120395")
    assert_instance_of Encrypter, enigma.encrypter
    assert_instance_of Decrypter, enigma.decrypter
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
