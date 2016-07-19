require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"

class TestPosition < Test::Unit::TestCase

  def test_position_equals
    assert Position.new(0, 0) == Position.new(0, 0)
  end

  def test_position_equals_with_nil
    assert_equal false, Position.new(0, 0) == nil
  end

end
