puts "Task 1"
a = (1..10).to_a
b = []

a.each {
|d| puts d	
}
puts 
puts a.select {|i| i > 5}
puts
puts b = a.select{|n| n.even?} 
puts 
puts a.unshift(3) << 11

puts "\n Task 2"
4.times {|i|
  a[i] = []
  4.times {|j|
    a[i][j] = rand(-10..10)
  }
}

puts "\n Task 3"
a = []
s=0
4.times {|i|
  a[i] = []
  4.times {|j|
    a[i][j] = rand(-10..10)
  }
}
print a

puts
puts a.flatten.select{|i|
   if i<0
   	 s+=i
   	 print i.to_s + " "
   end	
}

puts "\nСумма = " + s.to_s

puts "\n Task 4"

def create_date f1
    return f1 = 40.times {|i| f1[i] = rand(1..31) }	
end	

def create_month f2
	return f2 = 40.times {|i| f2[i] = rand(1..12) }
end	

def create_t f3
	return f3 = 40.times {|i| f3[i] = rand(-30..30) }
end	
a = [];b = [];c = [];d = [];q = [];q1 = [];q2 = []
create_date a
create_month b
create_t c

for e in 1..12 
   n = [];sum = 0;n1 = [];n2 = []
   b.each_with_index {|e1,index| if e1 == e 
   n.push(index) 
   end }
   
   n.each {|s| n1.push(a[s]) }
   
   n1.each {|s1| n2.push(c[s1]) }
   
   n2.each {|s1| sum +=s1 } 
   sum = sum/n1.size
   
   puts "Середня температура за " +e.to_s+ " месяц = " + sum.to_s
end   



