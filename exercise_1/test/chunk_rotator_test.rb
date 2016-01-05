require 'chunk_rotator'

class ChunkRotatorTest < Minitest::Test
  def test_it_rotates_each_character_by_the_offset_at_its_position
    assert_equal 'bcde', ChunkRotator.new('aaaa', [1, 2, 3, 4]).rotate
    assert_equal 'edcb', ChunkRotator.new('aaaa', [4, 3, 2, 1]).rotate
    assert_equal 'bcde', ChunkRotator.new('abcd', [1, 1, 1, 1]).rotate
  end

  def test_it_works_with_chunks_that_are_too_short_just_omitting_the_rotations_that_dont_exist
    assert_equal 'bbb', ChunkRotator.new('aaa', [1, 1, 1, 1]).rotate
    assert_equal 'bb',  ChunkRotator.new('aa',  [1, 1, 1, 1]).rotate
    assert_equal 'b',   ChunkRotator.new('a',   [1, 1, 1, 1]).rotate
    assert_equal '',    ChunkRotator.new('',    [1, 1, 1, 1]).rotate
  end

  def test_it_rotates_according_to_the_character_map
    assert_equal '0 .,', ChunkRotator.new('z9 .', [1, 1, 1, 1, 1]).rotate
  end

  def test_when_the_rotation_goes_past_the_end_of_the_character_map_it_wraps_around_to_the_beginning
    assert_equal 'a', ChunkRotator.new(',', [1, 1, 1, 1, 1]).rotate
  end
end
