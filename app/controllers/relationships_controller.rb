class RelationshipsController < ApplicationController


  def create
    @post =Post.find(params[:relationship][:post_id])
    current_user.follow!(@post)
    #redirect_to @post
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
  end
   end
    def destroy
      @post = Relationship.find(params[:id]).post
      current_user.unfollow!(@post)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
end