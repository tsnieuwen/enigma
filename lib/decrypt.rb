require './lib/enigma'
require './lib/decrypter'
require './lib/cipher'
require './lib/cryptable'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
normal_message = (handle.read).chomp
decrypted_hash = enigma.decrypt(normal_message, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_hash[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decrypted_hash[:key]} and date #{decrypted_hash[:date]}"
