class HomePagesController < ApplicationController
  def home
   # @posts = current_user.posts.paginate(page: params[:page])     if !current_user.nil?
  end

  def help
  end
end
