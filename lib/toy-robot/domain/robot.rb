class Robot
  attr_writer :table_top
  attr_reader :direction
  attr_reader :position

  def initialize
    @table_top = nil
    @direction = nil
    @position = nil
  end

  def set_direction_and_position(direction, position)
    if @table_top == nil
      # TODO: log
      return
    end

    unless @table_top.is_in_table_area(position)
      # TODO: log and ignore
      return
    end

    @direction = direction
    @position = position
  end

  def is_placed_on_table_top
    @table_top != nil && @direction != nil && @position != nil
  end
end
