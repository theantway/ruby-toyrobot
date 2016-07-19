
class Position
  attr_reader :x
  attr_reader :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(another)
    if(another == nil)
      return false
    end

    [x, y] == [another.x, another.y]
  end
end