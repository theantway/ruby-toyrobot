require_relative '../logger/logger'
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
      Logger.logger.warn('TableTop is nil when set direction and position')
      return
    end

    unless @table_top.is_position_in_table_area(position)
      Logger.logger.warn('Skip the position which is out of the table top')
      return
    end

    @direction = direction
    @position = position
  end

  def is_placed_on_table_top
    @table_top != nil && @direction != nil && @position != nil
  end
end
