require './lib/cryptable'

class Encrypter
  include Cryptable
  attr_reader :character_set,
              :cipher,
              :message

  def initialize(message, key = ((0..99999).to_a.sample).to_s.rjust(5, "0"), date = Time.now.strftime("%d%m%y"))
    @character_set = ("a".."z").to_a << " "
    @cipher = Cipher.new(key, date)
    @message = message.downcase
  end

  def shifted_message_indices_encrypt
    i = -1
    message_index.map do |element|
      i += 1
      if a_shift_indices.include?(i)
        element + @cipher.a_shift
      elsif b_shift_indices.include?(i)
        element + @cipher.b_shift
      elsif c_shift_indices.include?(i)
        element + @cipher.c_shift
      elsif d_shift_indices.include?(i)
        element + @cipher.d_shift
      end
    end
  end

  def encrypted_indices
    shifted_message_indices_encrypt.map do |index|
      index % 27
    end
  end

  def encrypted_characters
    collector = []
    encrypted_indices.each do |number|
      character_set_hash.each do |character, index|
        if index == number
          collector << character
        end
      end
    end
    collector
  end

  def encrypted_message
    encrypted_characters.join("")
  end

end
