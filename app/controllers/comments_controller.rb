class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.rss
      #format.js
    end
  end

  def create
    @comment = Comment.create!(params[:comment])
    flash[:notice] = "Thanks for commenting!"
    respond_to do |format|
      format.html { redirect_to comments_path }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash[:notice] = "Successfully destroyed comment."
      format.html { redirect_to comments_path }
      format.js
    end
    def new
      @comment = Comment.new
     # format.js
    end
  end


end