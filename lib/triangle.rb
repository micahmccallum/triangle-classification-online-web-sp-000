require 'pry'
class Triangle
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    if !self.is_valid?
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
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
    @side_a == @side_b && @side_b == @side_c
  end

  def is_isosceles?
    (@side_a == @side_b && @side_a != @side_c) ||
    (@side_b == @side_c && @side_b != @side_a) ||
    (@side_a == @side_c && @side_a != @side_b)
  end

  def is_scalene?
    @side_a != @side_b && @side_b != @side_c && @side_a != @side_c
  end

  def is_valid?
    @side_a > 0 && @side_b > 0 && @side_c > 0
  end

  class TriangleError < StandardError
    def message
      "message"
    end
  end
end
