require 'random_data'

 # Create Posts
 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 unique_post = Post.find_or_create_by(title: "This title", body: "This is the post body")
 unique_comment = Comment.find_or_create_by(body: "This is the comment body", post: unique_post)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
