class PostsController < ApplicationController
  before_filter :signed_in_user , only: [:create, :destroy, :new]
  # GET /posts
  # GET /posts.json
  def index
    @posts=Post.all
    @post = Post.new  # added
    respond_to do |format|
    format.html
    format.xml  { render xml: @posts }
    format.js
      end
  end
  def create
    @post = current_user.posts.build(params[:post])

    if @post.save
     # flash[:success] = "post created!"
      respond_to do |format|
        format.html { redirect_to root_url   }
        format.xml { redirect_to root_url    }
       # format.js  #added
        # redirect_to @user, notice: 'User was successfully created.'
     # format.xml { render xml: @post, status: :created, location: @post }
      end
      #database_authenticatable
     # redirect_to root_url
      #format.html { render action: "edit" }
    else
      render 'home_pages/home'
      #format.xml { render xml: @post.errors, status: :unprocessable_entity }
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "post deleted successfully!"
  # format.js #added
   # render 'posts/index'
   # redirect_to root_url
    render 'home_pages/home'
  end

 # GET /microposts/new
  # GET /microposts/new.json
  def new
    @post = current_user.posts.build if user_signed_in?
    respond_to do |format|
      format.html    {render 'posts/new'}
      format.xml { render xml: @post }
     # format.json { render json: @micropost }
    end

  end

  def followers

  end
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @post }
     # format.json { render json: @micropost }
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def  followers
    post = Post.find(params[:id])
    @users=post.followers
    render '/users/index'
  end
end
