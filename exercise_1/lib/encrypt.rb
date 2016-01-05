require_relative "offset_calculator"
require_relative "file_io"
require_relative "character_map"

class Encrypt

  attr_reader   :rotations, :file_io, :key, :date, :calc, :characters

  def initialize(key = nil, date = nil)
    @date    = date
    @key     = key
    @file_io = FileIO.new
    @calc    = OffsetCalculator.new(key, date)
    @characters = CharacterMap.new.characters
  end

  def get_rotations
    @rotations = calc.rotations
  end

  def encrypt_letter_a(letter)
    a_rotated_characters = characters.rotate(rotations[0])
    Hash[characters.zip(a_rotated_characters)][letter]
  end

  def encrypt_letter_b(letter)
    b_rotated_characters = characters.rotate(rotations[1])
    Hash[characters.zip(b_rotated_characters)][letter]
  end

  def encrypt_letter_c(letter)
    c_rotated_characters = characters.rotate(rotations[2])
    Hash[characters.zip(c_rotated_characters)][letter]
  end

  def encrypt_letter_d(letter)
    d_rotated_characters = characters.rotate(rotations[3])
    Hash[characters.zip(d_rotated_characters)][letter]
  end

  def encrypt(message)
    message.chars.each_slice(4).map { |chunk|
      ChunkRotator.new(chunk, rotations).rotate
    }.join
  end

  def print_message
    "Created '#{ARGV[1]}' with the key #{calc.key} and date #{calc.date}."
  end
end


if __FILE__ == $0

    file_io = FileIO.new
    message = file_io.message
    encryptor = Encrypt.new
    # ('12345', 280715)
    encryptor.get_rotations
    file_io.output(encryptor.encrypt(message))
    puts encryptor.print_message
end
