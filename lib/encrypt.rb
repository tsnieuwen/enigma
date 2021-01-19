require './lib/enigma'
require './lib/encrypter'
require './lib/cipher'
require './lib/cryptable'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
normal_message = (handle.read).chomp
key = ARGV[2]
date = ARGV[3]
encrypted_hash = nil

if key == nil && date == nil
  encrypted_hash = enigma.encrypt(normal_message)
elsif key != nil && date == nil
  encrypted_hash = enigma.encrypt(normal_message, key)
elsif key != nil && date != nil
  encrypted_hash = enigma.encrypt(normal_message, key, date)
end

writer = File.open(ARGV[1], "w")
writer.write(encrypted_hash[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
