require 'pry'
class Triangle
  attr_accessor :sides

  def initialize(sides, sides, sides)
    @sides = [sides, sides, sides]
    binding.pry
  end

  def kind
    if !self.is_valid?
      binding.pry
      # begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      # end
    end
    if self.is_equilateral?
      :equilateral
    elsif self.is_isosceles?
      :isosceles
    elsif self.is_scalene?
      :scalene
    end
  end

  def is_equilateral?
    @sides[0] == @sides[1] && @sides[1] == @sides[2]
  end

  def is_isosceles?
    (@sides[0] == @sides[1] && @sides[1] != @sides[2]) ||
    (@sides[1] == @sides[2] && @sides[2] != @sides[0]) ||
    (@sides[2] == @sides[0] && @sides[0] != @sides[1])
  end

  def is_scalene?
    @sides != @sides && @sides != @sides && @sides != @sides
  end

  def is_valid?

    (@sides > 0 && @sides > 0 && @sides > 0) &&
    ((@sides + @sides) > @sides)
  end

  class TriangleError < StandardError
    def message
      "message"
    end
  end
end
