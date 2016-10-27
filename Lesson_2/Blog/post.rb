class Post
   
   attr_reader :posts   

   def initialize 
      @@posts = {}
   end

   def add_posts(user)
      puts user 
      p " Write new post: "
      post = gets.chomp
      @@posts[post] = user
   end

   def user_post(user)
      @@posts.select{|k,v| v == user}
   end

   def remove_post(post, user)
      @@posts.delete_if{|po,u| po == post && u == user}
   end

   def all_posts
      @@posts
   end

   def edit_post (post,edit,user)
        @@posts.delete(post)
        @@posts[edit] = user 
   end
end
