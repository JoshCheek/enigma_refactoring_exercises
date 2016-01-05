require_relative "offset_calculator"
require_relative "file_io"
require_relative "character_map"

class Encrypt
  attr_reader :rotations, :file_io, :key, :date, :calc

  def initialize(key = nil, date = nil)
    @date      = date
    @key       = key
    @file_io   = FileIO.new
    @calc      = OffsetCalculator.new(key, date)
    @rotations = calc.rotations
  end

  def encrypt(message)
    message.scan(/.{1,4}/)
           .map { |chunk| ChunkRotator.new(chunk, rotations).rotate }
           .join
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
  file_io.output(encryptor.encrypt(message))
  puts encryptor.print_message
end
