class DictionarySearch
  def initialize(file)
    @dict = {}
    @word_pairs = []
    File.open(file, 'r') {|file| 
       file.each_line {|l|
        l.chomp!
        next if l[-1] == l[-2] || l.size < 3
           key = l[0..l.size-3]
           @dict[key] ||= []
           @dict[key] << l[-2..-1]
     }
   }
  end

  def word_pairs
     @dict.each_pair{|key,value|
        
     value.each_with_index{|d,i|
       value.each_with_index{|d1,i1|
         if value[i].to_s == value[i1].to_s.reverse
           @word_pairs << [key.to_s+value[i].to_s,key.to_s+value[i1].to_s]
           value.delete(value[i])
         end  
       } 
    }    
    }
    @word_pairs
  end
  
end

#pu = DictionarySearch.new("./wordsEn.txt")
#p pu


