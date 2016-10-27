class Like
  
   def initialize()
      @i=0
      @j=0
      @@likes      = {}
      @@user_like  = {}
   end

   def add_likes(user, post)
      @i+=1
      @@likes[post]=@i
      user_likes(user)
   end 

   def user_likes(user)
      @j+=1
      @@user_like[user]=@j
   end

   def posts_like(post)
      @@likes[post]
   end

   def users_like(user)
      @@user_like[user]
   end 
end
