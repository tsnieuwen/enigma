# require 'simplecov'
# SimpleCov.start
require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypter'
require './lib/cipher'
require './lib/cryptable'

class DecrypterTest < Minitest::Test

  def test_it_exists
    decrypter = Decrypter.new("dvwysjak pwdfjii", "12487", "120395")
    assert_instance_of Decrypter, decrypter
  end

  def test_it_has_readable_attributes
    decrypter = Decrypter.new("dvwysjak pwdfjii", "12487", "120395")
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, decrypter.character_set
    assert_instance_of Cipher, decrypter.cipher
    assert_equal "dvwysjak pwdfjii", decrypter.message
  end

  def test_decrypt
    decrypter = Decrypter.new("dvwysjak pwdfjii", "12487", "120395")

    expected = ["d", "v", "w", "y", "s", "j", "a", "k", " ", "p", "w", "d", "f", "j", "i", "i"]
    assert_equal expected, decrypter.split_message

    expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}
    assert_equal expected, decrypter.character_set_hash

    expected = [3, 21, 22, 24, 18, 9, 0, 10, 26, 15, 22, 3, 5, 9, 8, 8]
    assert_equal expected, decrypter.message_index

    expected = [0, 4, 8, 12]
    assert_equal expected, decrypter.a_shift_indices

    expected = [1, 5, 9, 13]
    assert_equal expected, decrypter.b_shift_indices

    expected = [2, 6, 10, 14]
    assert_equal expected, decrypter.c_shift_indices

    expected = [3, 7, 11, 15]
    assert_equal expected, decrypter.d_shift_indices

    assert_equal 9, decrypter.a_shift_decrypt
    assert_equal 3, decrypter.b_shift_decrypt
    assert_equal 4, decrypter.c_shift_decrypt
    assert_equal 16, decrypter.d_shift_decrypt

    expected = [12, 24, 26, 40, 27, 12, 4, 26, 35, 18, 26, 19, 14, 12, 12, 24]
    assert_equal expected, decrypter.shifted_message_indices_decrypt

    expected = [12, 24, 26, 13, 0, 12, 4, 26, 8, 18, 26, 19, 14, 12, 12, 24]
    assert_equal expected, decrypter.decrypted_indices

    expected = ["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "t", "o", "m", "m", "y"]
    assert_equal expected, decrypter.decrypted_characters

    expected = "my name is tommy"
    assert_equal expected, decrypter.decrypted_message
  end

end
