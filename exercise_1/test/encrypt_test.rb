require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def test_word_encrypts_properly_based_on_4_part_rotation
    encryptor = Encrypt.new("12345", "280715")
    assert_equal "bny,", encryptor.encrypt("1111")
  end

  def test_input_string_length_equals_output_string_length
    encryptor = Encrypt.new("12345", "280715")
    input = "1111"
    assert input.length == encryptor.encrypt(input).length
  end

  def test_encrypts_file
    file_io = FileIO.new
    message = file_io.message("encrypt_test.txt")
    encryptor = Encrypt.new("12345", "280715")
    assert_equal "bny,", encryptor.encrypt(message)
  end

  def test_prints_output_message_to_command_line
    file_io = FileIO.new
    message = file_io.message("encrypt_test.txt")
    encryptor = Encrypt.new("12345", "280715")
    file_io.output(encryptor.encrypt(message), "encrypt_test_results.txt")
    encryptor.print_message
    assert_equal "Created '' with the key 12345 and date 280715.", encryptor.print_message
  end
end
