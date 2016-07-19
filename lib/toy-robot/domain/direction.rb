
class Direction
  @@NORTH = 0
  @@EAST = 1
  @@SOUTH = 2
  @@WEST = 3

  def self.left(direction)
    if direction == nil || direction < @@NORTH || direction > @@WEST
      # TODO: log error
      return nil
    end

    left_direction = direction - 1
    if left_direction < @@NORTH
      left_direction = @@WEST
    end

    left_direction
  end

  def self.right(direction)
    if direction == nil || direction < @@NORTH || direction > @@WEST
      # TODO: log error
      return nil
    end

    left_direction = direction + 1
    if left_direction > @@WEST
      left_direction = @@NORTH
    end

    left_direction
  end

  def self.next_position(direction, position)
    case direction
      when @@NORTH
        return Position.new(position.x, position.y + 1)
      when @@EAST
        return Position.new(position.x + 1, position.y)
      when @@SOUTH
        return Position.new(position.x, position.y - 1)
      when @@WEST
        return Position.new(position.x - 1, position.y)
    end

  #   TODO: log error
  end

  def self.NORTH
    @@NORTH
  end
  def self.EAST
    @@EAST
  end
  def self.SOUTH
    @@SOUTH
  end
  def self.WEST
    @@WEST
  end
end