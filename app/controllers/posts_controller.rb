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
    else
      render 'static_pages/home'
    end
  end
  def destroy
  end
end
