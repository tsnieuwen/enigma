require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypter'
require './lib/cipher'

class EncrypterTest < Minitest::Test

  def test_it_exists
    encrypter = Encrypter.new("my name is tommy", "12487", "120395")
    assert_instance_of Encrypter, encrypter
  end

  def test_it_has_readable_attributes
    encrypter = Encrypter.new("MY NAME IS TOMMY", "12487", "120395")
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, encrypter.character_set
    assert_instance_of Cipher, encrypter.cipher
    assert_equal "my name is tommy", encrypter.message
  end

  def test_encrypt
    encrypter = Encrypter.new("MY NAME IS TOMMY", "12487", "120395")

    expected = ["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "t", "o", "m", "m", "y"]
    assert_equal expected, encrypter.split_message

    # expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}
    # assert_equal expected, encrypter.character_set_hash
    #
    # expected = [12, 24, 26, 13, 0, 12, 4, 26, 8, 18, 26, 19, 14, 12, 12, 24]
    # assert_equal expected, encrypter.message_index
    #
    # expected = [0, 4, 8, 12]
    # assert_equal expected, encrypter.a_shift_indices
    #
    # expected = [1, 5, 9, 13]
    # assert_equal expected, encrypter.b_shift_indices
    #
    # expected = [2, 6, 10, 14]
    # assert_equal expected, encrypter.c_shift_indices
    #
    # expected = [3, 7, 11, 15]
    # assert_equal expected, encrypter.d_shift_indices
    #
    # expected = [30, 48, 76, 105, 18, 36, 54, 118, 26, 42, 76, 111, 32, 36, 62, 116]
    # assert_equal expected, encrypter.shifted_message_indices_encrypt
    #
    # expected = [3, 21, 22, 24, 18, 9, 0, 10, 26, 15, 22, 3, 5, 9, 8, 8]
    # assert_equal expected, encrypter.encrypted_indices
    #
    # expected = ["d", "v", "w", "y", "s", "j", "a", "k", " ", "p", "w", "d", "f", "j", "i", "i"]
    # assert_equal expected, encrypter.encrypted_characters
    #
    # expected = "dvwysjak pwdfjii"
    # assert_equal expected, encrypter.encrypted_message
  end

end
