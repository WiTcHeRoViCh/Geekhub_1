class User
   attr_reader :name, :second_name, :age
   @@all_users = [] 

   def initialize(params={name: name, second_name: second_name, age: age})
      @name         = params[:name]
      @second_name  = params[:second_name]
      @age          = params[:age]
      add_user(params)      
   end

   def add_user(params)
      @@all_users << params
   end    

   def show_all
      p @@all_users
   end
   
end


