class OffsetGenerator
  def generate_offset(date)
    squared = date.to_i**2
    @offset = squared.to_s[-4..-1]
  end
end
