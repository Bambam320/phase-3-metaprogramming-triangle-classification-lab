require 'pry'

class Triangle
  attr_reader :s1, :s2, :s3, :valid_state

  def initialize s1, s2, s3
    @s1 = s1
    @s2 = s2
    @s3 = s3
    if s1 > 0 && s2 > 0 && s3 > 0 && s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
      @valid_state = true
    else
      @valid_state = false
    end
  end

  def kind 
    if @s1 == @s2 && @s1 == @s3 && @valid_state
      :equilateral
    elsif @s1 != @s2 && @s1 != @s3 && @s2 != @s3 && @valid_state
      :scalene
    elsif @s1 == @s2 && @s1 != @s3 && @valid_state
      :isosceles
    elsif @s1 == @s3 && @s1 != @s2 && @valid_state
      :isosceles
    elsif @s2 == @s3 && @s2 != @s1 && @valid_state
      :isosceles
    elsif !@valid_state
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "you must do triangles better!"
    end
  end
end
