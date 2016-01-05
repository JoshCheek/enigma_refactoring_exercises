require 'key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_key_is_a_five_digit_number
    key = KeyGenerator.new
    assert_equal 5, key.generate_key.length
    assert key.generate_key.class == String
  end

  def test_key_is_random_number
    key1 = KeyGenerator.new.generate_key
    key2 = KeyGenerator.new.generate_key
    refute key1 == key2
  end
end
