require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
normal_message = (handle.read).chomp
encrypted_hash = enigma.encrypt(normal_message)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_hash[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
