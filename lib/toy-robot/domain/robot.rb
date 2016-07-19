class Robot
  attr_writer :tableTop
  attr_reader :direction
  attr_reader :position

  def initialize
    @tableTop = nil
    @direction = nil
    @position = nil
  end

  def set_direction_and_position(direction, position)
    if @tableTop == nil
      # TODO: exception
      return
    end

    if !@tableTop.is_in_table_area(position)
      # TODO: log and ignore
      return
    end

    @direction = direction
    @position = position
  end

  def is_placed_on_table_top
    @tableTop != nil && @direction != nil && @position != nil
  end
end
