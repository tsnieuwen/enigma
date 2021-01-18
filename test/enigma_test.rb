require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
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

  # def test_keys
  #   enigma = Enigma.new
  #   enigma.encrypt("my name is tommy", "12487", "120395")
  #   assert_equal 12, enigma.a_key
  #   assert_equal 24, enigma.b_key
  #   assert_equal 48, enigma.c_key
  #   assert_equal 87, enigma.d_key
  # end

  # def test_offsets
  #   enigma = Enigma.new
  #   enigma.encrypt("my name is tommy", "12487", "120395")
  #   assert_equal 14494956025, enigma.date_squared
  #   assert_equal 6, enigma.a_offset
  #   assert_equal 0, enigma.b_offset
  #   assert_equal 2, enigma.c_offset
  #   assert_equal 5, enigma.d_offset
  # end
  #
  # def test_shifts
  #   enigma = Enigma.new
  #   enigma.encrypt("my name is tommy", "12487", "120395")
  #   assert_equal 18, enigma.a_shift
  #   assert_equal 24, enigma.b_shift
  #   assert_equal 50, enigma.c_shift
  #   assert_equal 92, enigma.d_shift
  # end

  # def test_encrypt
  #   enigma = Enigma.new
  #   enigma.encrypt("my name is tommy", "12487", "120395")
  #
  #   expected = ["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "t", "o", "m", "m", "y"]
  #   assert_equal expected, enigma.split_message
  #
  #   expected = {"a"=>0, "b"=>1, "c"=>2, "d"=>3, "e"=>4, "f"=>5, "g"=>6, "h"=>7, "i"=>8, "j"=>9, "k"=>10, "l"=>11, "m"=>12, "n"=>13, "o"=>14, "p"=>15, "q"=>16, "r"=>17, "s"=>18, "t"=>19, "u"=>20, "v"=>21, "w"=>22, "x"=>23, "y"=>24, "z"=>25, " "=>26}
  #   assert_equal expected, enigma.character_set_hash
  #
  #   expected = [12, 24, 26, 13, 0, 12, 4, 26, 8, 18, 26, 19, 14, 12, 12, 24]
  #   assert_equal expected, enigma.message_index
  #
  #   expected = [0, 4, 8, 12]
  #   assert_equal expected, enigma.a_shift_indices
  #
  #   expected = [1, 5, 9, 13]
  #   assert_equal expected, enigma.b_shift_indices
  #
  #   expected = [2, 6, 10, 14]
  #   assert_equal expected, enigma.c_shift_indices
  #
  #   expected = [3, 7, 11, 15]
  #   assert_equal expected, enigma.d_shift_indices
  #
  #   expected = [30, 48, 76, 105, 18, 36, 54, 118, 26, 42, 76, 111, 32, 36, 62, 116]
  #   assert_equal expected, enigma.shifted_message_indices_encrypt
  #
  #   expected = [3, 21, 22, 24, 18, 9, 0, 10, 26, 15, 22, 3, 5, 9, 8, 8]
  #   assert_equal expected, enigma.encrypted_indices
  #
  #   expected = ["d", "v", "w", "y", "s", "j", "a", "k", " ", "p", "w", "d", "f", "j", "i", "i"]
  #   assert_equal expected, enigma.encrypted_characters
  #
  #   expected = "dvwysjak pwdfjii"
  #   assert_equal expected, enigma.encrypted_message
  # end
  #
  # def test_decrypt
  #   enigma = Enigma.new
  #   expected = {decryption: "my name is tommy",
  #               key: "12487",
  #               date: "120395"
  #               }
  #   assert_equal expected, enigma.decrypt("dvwysjak pwdfjii", "12487", "120395")
  # end
  #
  # def test_decrypt_split_text
  #   enigma = Enigma.new
  #   enigma.decrypt("dvwysjak pwdfjii", "12487", "120395")
  #   expected = [3, 21, 22, 24, 18, 9, 0, 10, 26, 15, 22, 3, 5, 9, 8, 8]
  #   assert_equal expected, enigma.message_index
  #   assert_equal 9, enigma.a_shift_decrypt
  #   assert_equal 3, enigma.b_shift_decrypt
  #   assert_equal 4, enigma.c_shift_decrypt
  #   assert_equal 16, enigma.d_shift_decrypt
  #   expected = [12, 24, 26, 40, 27, 12, 4, 26, 35, 18, 26, 19, 14, 12, 12, 24]
  #   assert_equal expected, enigma.shifted_message_indices_decrypt
  #   expected = [12, 24, 26, 13, 0, 12, 4, 26, 8, 18, 26, 19, 14, 12, 12, 24]
  #   assert_equal expected, enigma.decrypted_indices
  #   expected = ["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "t", "o", "m", "m", "y"]
  #   assert_equal expected, enigma.decrypted_characters
  #   expected = "my name is tommy"
  #   assert_equal expected, enigma.decrypted_message
  # end
  #
  # def test_encrypt_no_given_key
  #   enigma = Enigma.new
  # end

end
