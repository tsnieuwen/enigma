module Cryptable

  def split_message
    @message.split("")
  end

  # def character_set_hash
  #   new_hash = Hash.new
  #     @character_set.each do |character|
  #       new_hash[character] = @character_set.index(character)
  #     end
  #   new_hash
  # end
  #
  # def message_index(@massage)
  #   split_message().map do |character|
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
end
