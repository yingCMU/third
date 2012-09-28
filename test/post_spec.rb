require 'spec_helper'
describe "home page" do
  it "displays the user's username after successful login" do
    user = User.create!(:email => "1@126.com", :password => "111111")
    get "/accounts/sign_in"
    before { new_user_session_path user }


   # post "/login", :username => "jdoe", :password => "secret"
    assert_select "p", :text => "Signed in successfully."
  end
end
