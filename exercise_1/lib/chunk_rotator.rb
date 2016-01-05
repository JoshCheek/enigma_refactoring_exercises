class ChunkRotator
  attr_reader :chunk, :rotations, :character_map

  def initialize(chunk, rotations)
    @chunk         = chunk
    @rotations     = rotations
    @character_map = CharacterMap.new
  end

  def rotate
    chunk.chars
         .zip(rotations)
         .map { |char, rotation| @character_map.rotate char, rotation }
         .join
  end
end
