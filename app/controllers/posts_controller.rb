class PostsController < ApplicationController

  before_action :require_sign_in, except: :show #redirect guest users from actions they can't do (except show)

  def show
    @post = Post.find(params[:id]) #find post corresponding to the id in the params that was passed to show & assign it to @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build(post_params) #uses mass assignment

     @post.user = current_user #associates new posts with current_user (like with topic, right above)

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
    @post.assign_attributes(post_params)#uses mass assignment
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

  # remember to add private methods to the bottom of the file. Any method defined below private, will be private.
   private
   def post_params
     params.require(:post).permit(:title, :body) #allows to create/update title and body.
   end

end
