class CharacterMap
  attr_reader :characters, :character_hash

  def initialize
    @characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", "," ]
    @character_hash = Hash[characters.zip(1..39)]
  end

  def rotate(char, rotation)
    rotated_index = (index_of(char) + rotation) % length
    characters[rotated_index]
  end

  def index_of(char)
    characters.index(char)
  end

  def length
    characters.length
  end
end
