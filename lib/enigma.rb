class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = ((0..99999).to_a.sample).to_s.rjust(5, "0"), date = Time.now.strftime("%d%m%y"))
    @key_to_integer = key.to_i
    @date = date.to_i
    @message = message.downcase
    @encryption_output = {encryption: encrypted_message, key: key, date: date}
  end

  def a_key
    (@key_to_integer.digits.reverse[0].to_s + @key_to_integer.digits.reverse[1].to_s).to_i
  end

  def b_key
    (@key_to_integer.digits.reverse[1].to_s + @key_to_integer.digits.reverse[2].to_s).to_i
  end

  def c_key
    (@key_to_integer.digits.reverse[2].to_s + @key_to_integer.digits.reverse[3].to_s).to_i
  end

  def d_key
    (@key_to_integer.digits.reverse[3].to_s + @key_to_integer.digits.reverse[4].to_s).to_i
  end

  def date_squared
    @date ** 2
  end

  def a_offset
    date_squared.digits.reverse[-4]
  end

  def b_offset
    date_squared.digits.reverse[-3]
  end

  def c_offset
    date_squared.digits.reverse[-2]
  end

  def d_offset
    date_squared.digits.reverse[-1]
  end

  def a_shift
    a_key + a_offset
  end

  def b_shift
    b_key + b_offset
  end

  def c_shift
    c_key + c_offset
  end

  def d_shift
    d_key + d_offset
  end

  def split_message
    @message.split("")
  end

  def character_set_hash
    new_hash = Hash.new
      @character_set.each do |character|
        new_hash[character] = @character_set.index(character)
      end
    new_hash
  end

  def message_index
    split_message.map do |character|
      character_set_hash[character]
    end
  end

  def a_shift_indices
    x = []
    index_number = 0
    while index_number < message_index.count
      x << index_number
      index_number += 4
    end
    x
  end

  def b_shift_indices
    x = []
    index_number = 1
    while index_number < message_index.count
      x << index_number
      index_number += 4
    end
    x
  end

  def c_shift_indices
    x = []
    index_number = 2
    while index_number < message_index.count
      x << index_number
      index_number += 4
    end
    x
  end

  def d_shift_indices
    x = []
    index_number = 3
    while index_number < message_index.count
      x << index_number
      index_number += 4
    end
    x
  end

  def shifted_message_indices_encrypt
    i = -1
    message_index.map do |element|
      i += 1
      if a_shift_indices.include?(i)
        element + a_shift
      elsif b_shift_indices.include?(i)
        element + b_shift
      elsif c_shift_indices.include?(i)
        element + c_shift
      elsif d_shift_indices.include?(i)
        element + d_shift
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

  def decrypt(ciphertext, key, date = ((Time.now.to_s.split("")[8..9]) + (Time.now.to_s.split("")[5..6]) + (Time.now.to_s.split("")[2..3])).join(""))
    @key_to_integer = key.to_i
    @date = date.to_i
    @message = ciphertext
    encryption_output = {decryption: decrypted_message, key: key, date: date}
  end

  def a_shift_decrypt
    27 - (a_shift % 27)
  end

  def b_shift_decrypt
    27 - (b_shift % 27)
  end

  def c_shift_decrypt
    27 - (c_shift % 27)
  end

  def d_shift_decrypt
    27 - (d_shift % 27)
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
