class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts=Post.all
  end
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
      #format.html { render action: "edit" }
    else
      render 'static_pages/home'
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "post deleted successfully!"
   # render 'posts/index'
   # redirect_to root_url
    render 'static_pages/home'
  end
  def new
    @post = current_user.posts.build if user_signed_in?


  end

  def followers

  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
end
