require './lib/cryptable'

class Decrypter
  include Cryptable
  attr_reader :character_set,
              :cipher,
              :message

  def initialize(ciphertext, key = ((0..99999).to_a.sample).to_s.rjust(5, "0"), date = Time.now.strftime("%d%m%y"))
    @character_set = ("a".."z").to_a << " "
    @cipher = Cipher.new(key, date)
    @message = ciphertext.downcase
  end

  # def split_message
  #   @message.split("")
  # end
  #
  # def character_set_hash
  #   new_hash = Hash.new
  #     @character_set.each do |character|
  #       new_hash[character] = @character_set.index(character)
  #     end
  #   new_hash
  # end
  #
  # def message_index
  #   split_message.map do |character|
  #     character_set_hash[character]
  #   end
  # end
  #
  # def a_shift_indices
  #   x = []
  #   index_number = 0
  #   while index_number < message_index.count
  #     x << index_number
  #     index_number += 4
  #   end
  #   x
  # end
  #
  # def b_shift_indices
  #   x = []
  #   index_number = 1
  #   while index_number < message_index.count
  #     x << index_number
  #     index_number += 4
  #   end
  #   x
  # end
  #
  # def c_shift_indices
  #   x = []
  #   index_number = 2
  #   while index_number < message_index.count
  #     x << index_number
  #     index_number += 4
  #   end
  #   x
  # end
  #
  # def d_shift_indices
  #   x = []
  #   index_number = 3
  #   while index_number < message_index.count
  #     x << index_number
  #     index_number += 4
  #   end
  #   x
  # end
  #
  def a_shift_decrypt
    27 - (@cipher.a_shift % 27)
  end

  def b_shift_decrypt
    27 - (@cipher.b_shift % 27)
  end

  def c_shift_decrypt
    27 - (@cipher.c_shift % 27)
  end

  def d_shift_decrypt
    27 - (@cipher.d_shift % 27)
  end

  def shifted_message_indices_decrypt
    i = -1
    message_index.map do |element|
      i += 1
      if a_shift_indices.include?(i)
        element + a_shift_decrypt
      elsif b_shift_indices.include?(i)
        element + b_shift_decrypt
      elsif c_shift_indices.include?(i)
        element + c_shift_decrypt
      elsif d_shift_indices.include?(i)
        element + d_shift_decrypt
      end
    end
  end

  def decrypted_indices
    shifted_message_indices_decrypt.map do |index|
      index % 27
    end
  end

  def decrypted_characters
    collector = []
    decrypted_indices.each do |number|
      character_set_hash.each do |character, index|
        if index == number
          collector << character
        end
      end
    end
    collector
  end

  def decrypted_message
    decrypted_characters.join("")
  end

end
