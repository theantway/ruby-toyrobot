class TableTop
  def initialize(width, length)
    @width = width
    @length = length
  end

  def is_in_table_area(position)
    position != nil && position.x >= 0 && position.x < @width &&
        position.y >= 0 && position.y < @length
  end
end