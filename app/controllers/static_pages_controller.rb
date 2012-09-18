class StaticPagesController < ApplicationController
  def home
    @microposts = current_user.microposts.paginate(page: params[:page])     if !current_user.nil?
  end

  def help
  end
end
