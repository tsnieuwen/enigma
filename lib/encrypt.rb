require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
normal_message = (handle.read).chomp
# p normal_message
puts enigma.encrypt(normal_message)
