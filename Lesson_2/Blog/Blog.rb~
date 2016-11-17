require_relative "user"
require_relative "post"
require_relative "like"

user = User.new(name: "Andrew", second_name: "Udov", age: 18)
user1 = User.new(name: "Andrew1", second_name: "Udov1", age: 18)
#user.show_all

post = Post.new
p post.add_posts(user)
#p post.add_posts(user)
#p post.add_posts(user1)
#p post.all_posts

#post.edit_post("Adds","dsdsds",user)
#p post.all_posts
#post.remove_post("rfr",user)
#p post.all_posts
#puts
#p post.user_post(user)

like = Like.new()

like.add_likes(user, "rfr")
like.add_likes(user, "rfr")
p like.users_like(user)
p like.posts_like("rfr")
