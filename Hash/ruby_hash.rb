puts "Task 1"

f = {a: 1, b: 1}
g = (:a..:z).to_a
g[2..-1].each_with_index{|i,j| f[i] = f[g[j+1]]+f[g[j]] }
puts f.select{|k,v| v<15}

puts "Task 2"

{'yes' => 23, 'b' => 'travel', 'yesterday' => 34, :yesss => :fg, try: 30, key: 'some value', 'yesterday1' => 34, 'yesteryear' => 2014}
puts a.select{|key,value| (key.to_s).include? "yes" }
