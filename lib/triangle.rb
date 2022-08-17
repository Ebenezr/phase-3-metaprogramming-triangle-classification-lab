class Triangle
  # write code here
  attr_reader :s1, :s2, :s3

  def initialize(s1,s2,s3)
    @s1=s1
    @s2=s2
    @s3=s3
  end  
  
  def kind
    validate_triangle
      if  s1 == s2 && s2 == s3
        :equilateral
      elsif s1 == s2 || s2  == s3 || s3 == s1 
        :isosceles
      else  
        :scalene
      end
  end    


  def validate_triangle
    real_triangle =  [(s1 + s2 > s3), (s1 + s3 > s2), (s2 + s3 > s1)]
      [s1, s2, s3].each do |side|
        real_triangle << false if side <= 0 
      if real_triangle.include?(false)
        begin
          raise TriangleError
        rescue TriangleError => error
          puts error.message
        end
      end
  end
      
  class TriangleError < StandardError
    def message
      "Triangle inequality failed"
    end
  end

end
