require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
normal_message = (handle.read).chomp
key = ARGV[2]
date = ARGV[3]
decrypted_hash = enigma.decrypt(normal_message, key, date)

writer = File.open(ARGV[1], "w")
writer.write(decrypted_hash[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decrypted_hash[:key]} and date #{decrypted_hash[:date]}"
