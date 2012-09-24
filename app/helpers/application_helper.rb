module ApplicationHelper
  def signed_in_user
    unless user_signed_in?
     #store_location
      redirect_to root_url, notice: "Want to see posts? Please sign in."
    end
  end

end
