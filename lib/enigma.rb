class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = ((0..99999).to_a.sample).to_s.rjust(5, "0"), date = Time.now.strftime("%d%m%y"))
    @encrypter = Encrypter.new(message, key, date)
    @encryption_output = {encryption: @encrypter.encrypted_message, key: key, date: date}
  end

  def decrypt(ciphertext, key, date = Time.now.strftime("%d%m%y"))
    @decrypter = Decrypter.new(ciphertext, key, date)
    encryption_output = {decryption: @decrypter.decrypted_message, key: key, date: date}
  end

end
