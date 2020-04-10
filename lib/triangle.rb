require 'pry'
class Triangle
  attr_accessor :sides

  def initialize(side_a, side_b, side_c)
    @sides = [side_a, side_b, side_c]
    @sides.sort!
  end

  def kind
    if !self.is_valid?
      raise TriangleError
    elsif self.is_equilateral?
      :equilateral
    elsif self.is_isosceles?
      :isosceles
    elsif self.is_scalene?
      :scalene
    end
  end

  def is_equilateral?
    @sides[0] == @sides[2]
  end

  def is_isosceles?
    (@sides[0] == @sides[1] && @sides[1] != @sides[2]) ||
    (@sides[1] == @sides[2] && @sides[1] != @sides[0])
  end

  def is_scalene?
    @sides[0] != @sides[1] && @sides[1] != @sides[2]
  end

  def is_valid?
  (@sides[0] > 0) && ((@sides[0] + @sides[1]) > @sides[2])
  end

  class TriangleError < StandardError
  end
end
