require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"

class TestTableTop < Test::Unit::TestCase


  def test_bottom_left_position_inside_table_top
    assert TableTop.new(5, 5).is_in_table_area(Position.new(0, 0))
  end

  def test_top_left_position_inside_table_top
    assert TableTop.new(5, 5).is_in_table_area(Position.new(0, 4))
  end

  def test_bottom_right_position_inside_table_top
    assert TableTop.new(5, 5).is_in_table_area(Position.new(4, 0))
  end

  def test_top_right_position_inside_table_top
    assert TableTop.new(5, 5).is_in_table_area(Position.new(4, 4))
  end

  def test_nil_position
    assert_equal false, TableTop.new(5, 5).is_in_table_area(nil)
  end

  def test_out_bottom
    assert_equal false, TableTop.new(5, 5).is_in_table_area(Position.new(0, -1))
  end

  def test_out_right
    assert_equal false, TableTop.new(5, 5).is_in_table_area(Position.new(5, 4))
  end

  def test_out_top_range
    assert_equal false, TableTop.new(5, 5).is_in_table_area(Position.new(4, 5))
  end

  def test_out_left_range
    assert_equal(false, TableTop.new(5, 5).is_in_table_area(Position.new(-1, 4)))
  end

end
