class Dragon
   def initialize name
      @name = name
      @feed = 7
      @walk = 7
      @tired = 0
      @health = 10
      @happy = 0
      @fridge = {dragon_food: 2,apple: 1}
      @walk_places = {park: 1,river: 2}

      @check_food = true; @check_tired = true; @check_walk = true
      @array_commands = ["feeding","ls","exit","walking","sleeping","status","playing"]
      puts "Your dragon name is " +name
   end

   def feeding
      begin
        @check_food = false
        begin
           puts "What you want to give your pet?(\"ls\" for help)"
           food_select = gets.chomp
           check_ls food_select, @fridge
        end until food_select != "ls"

        @fridge.select{|k,v| if k.to_s == food_select
        puts "You give your pet "+k.to_s+". Feed increased in "+v.to_s+" point";
        @feed+=v;end }

        passageOfTime
        @check_food = true
        puts "You want to feed you pet again?(To exit \"no\")"
      end until gets.chomp == "no"
   end

   def walking
      begin
        @check_walk = false
        begin
           puts "You go walking. Where do you want to go?(\"ls\" for help)"
           walk_select = gets.chomp
           check_ls walk_select, @walk_places
        end until walk_select !="ls"

        @walk_places.select{|k,v| if k.to_s == walk_select
        puts "You went to the "+k.to_s+". Walk increased in "+v.to_s+" point";
        @walk+=v;end }

        passageOfTime
        @check_walk = true
        puts "You want to walk you pet again?(To exit \"no\")"
     end until gets.chomp == "no"
   end

   def sleeping
      begin
         @check_tired = false
         puts "Your pet go to bed."
         @tired-=2;@feed-=1;@walk-=1

         passageOfTime
         @check_tired = true
         puts "You want put to sleep your pet again?(To exit \"no\")"

      end until gets.chomp == "no"
   end
   
   def playing 
   	  puts "You played with your pet"
   	  passageOfTime
 
   end	

   def ls command
       if command == "feeding"
           feeding
       elsif command == "ls"
           print @array_commands
           puts
       elsif command == "exit"
           exit
       elsif command == "status"
           status
       elsif command == "walking"
           walking
       elsif command == "sleeping"
           sleeping
       elsif command == "playing"
           playing
       else
           puts "No such method"
       end
   end

   def status
       puts "Name:   " + @name
       puts "Health: " + @health.to_s
       puts "Food:   " + @feed.to_s
       puts "Tired:  " + @tired.to_s
       puts "Walk:   " + @walk.to_s
       puts "Happy:  " + @happy.to_s
   end

   def check_ls (word, array)
      if word == "ls"
          p array
      end
   end

   private

   def passageOfTime
      if @feed >= 0 && @check_food == true
          @feed-=1
          if @feed <=5 && @feed >=2
          	 puts "Your pet is hungry"
          	 puts "Happy -2"
          	 @happy-=2
          elsif @feed < 2 && @feed > 0
             puts "You need to feed your pet"
             puts "Happy -3"
             @happy-=3
          elsif @feed <= 0
             puts "Your pet is fell bad"
             puts "Health -2"
             @health-=2
          end
      end      
          
      if @happy <20 
      	 @happy+=2
      elsif @happy <0
      	 puts "Your pet isn't happy"
      	 puts "Try to play with him"
      elsif @happy == 20
         puts "Your pet is very happy"
         puts "The game is over"
         puts "Сongratulations"
         exit
      end

      if @walk >= 0 && @check_walk == true
         @walk-=1
         if @walk <=5 && @tired >=2
         	puts "Your pet want to go for a walk"
         	puts "Happy -2"
         	@happy-=2
         elsif @walk <2 && @tired >0
            puts "Pet is angry on you"
            puts "Happy -3"
            @happy-=3
         elsif @walk == 0
            puts "Your dog ran away from you"
            puts "Health -2. Feed -2. Tired +2. Walk +3"
            @health-=2;@feed-=2;@tired+=2;@walk+=3
         end	
      end

      if @tired <= 10 && @check_tired == true
         @tired+=1
         if @tired >=8 && @tired <9
           	puts "Your pet want to sleep"
         	puts "Happy -2"
         	@happy-=2
         elsif @tired >=10
            puts "You pet fell to the ground from exhaustion and asleep"
            puts "Tired - 5. Feed -2. Walk -2"
            @tired-=5; @feed-=2; @walk-=2
         end	
      end
      
      if @health == 0
         puts @name +" have die"
         exit
      end      
   end

end

dragon = Dragon.new 'Cheburator'
puts "If you want to win in this game, you should score 20 points of Happy"
while true
    puts "Enter the command(\"ls\" for help)"
    a = gets.chomp
    dragon.ls a
end
