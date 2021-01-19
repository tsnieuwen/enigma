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
