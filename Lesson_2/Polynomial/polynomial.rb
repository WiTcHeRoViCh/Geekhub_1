class Polynomial
  def initialize(elements=[])
     raise ArgumentError.new("Two or more coefficients are required") if elements.size<2

     @polynom = []
     last = elements.last.zero?
     elements.reject!(&:zero?)
     return @polynom = 0.to_s if elements.empty?
     elements.each_with_index{|num,ind|
         
          
         if num > 0 
            @polynom << "+" unless ind.zero?
         else
            @polynom << "-" unless num.zero?
         end
         
         @polynom << "x^" + (elements.size - ind).to_s if num.abs == 1
         @polynom << (num.abs).to_s + "x^"+(elements.size - ind).to_s if num != 0 && num.abs !=1 && ind != elements.index(elements.last)
         @polynom << (num.abs).to_s if ind == elements.index(elements.last) && elements.last!=0
    }
    if @polynom.size.zero?
        @polynom = 0 	
    end
    @polynom << "x" if last
    @polynom = @polynom.join
  end

  def to_s
  	
  end
end
