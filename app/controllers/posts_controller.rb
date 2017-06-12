class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id]) #find post corresponding to the id in the params that was passed to show & assign it to @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
     @post = Post.new #creates new instance of post
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
     @topic = Topic.find(params[:topic_id])
     @post.topic = @topic
     if @post.save # if Post is saved to database > display success message with flash[:notice]
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
     @post = Post.find(params[:id])
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else #If destroy fails
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
  end

end
