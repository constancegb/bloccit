class FavoriteMailer < ApplicationMailer
  default from: "constancegobert@hotmail.fr"

  def new_comment(user, post, comment)
     #set three different headers to enable conversation threading
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, subject: "New comment on #{post.title}",
          cc: "messages+b752d85e-397d-45f2-9c21-3a22ee917d66+2358427@reply.bloc.io")
   end

end
