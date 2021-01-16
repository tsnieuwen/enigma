class Enigma
  attr_reader :message,
              :key,
              :date,
              :character_set

  def initialize(message, key, date)
    @message = message
    @key = key.to_i
    @date = date.to_i
    @character_set = ("a".."z").to_a << " "

  end

  def a_key
    (@key.digits.reverse[0].to_s + @key.digits.reverse[1].to_s).to_i
  end

  def b_key
    (@key.digits.reverse[1].to_s + @key.digits.reverse[2].to_s).to_i
  end

  def c_key
    (@key.digits.reverse[2].to_s + @key.digits.reverse[3].to_s).to_i
  end

  def d_key
    (@key.digits.reverse[3].to_s + @key.digits.reverse[4].to_s).to_i
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
    message.split("")
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

  def shifted_message_indices
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
    shifted_message_indices.map do |index|
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
