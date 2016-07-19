class TableTop
  attr_reader :width
  attr_reader :length

  def initialize(width, length)
    @width = width
    @length = length
  end

  def is_in_table_area(position)
    position.x >= 0 && position.x < @width &&
        position.y >= 0 && position.y < @length
  end
end