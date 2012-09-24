#???
require 'spec_helper'


describe PostsController ,:type => :controller     do
 # render_views
  before { visit new_user_registration_path
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobar"
  fill_in "Password confirmation", with: "foobar"
  click_button "Sign up" }
  describe "GET 'new'" do

    it "should be successful" do
    #  expect { click_button "Sign up" }.to change(User, :count).by(1)
      get :new
      response.should be_success
    end

   # it "should prepare categories" do
    #  get :new
     # assigns(:categories).should_not be_nil
   # end
  end


  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :place => "",  :details => "" }
      end

      it "should not create a listing" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end

      it "should render the home page" do
        post :create, :post => @attr
        response.should redirect_to(root_path)
     #   response.should render_template('/')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :title => "Lorem ipsum",
                  :details => "Lorem ipsum",
                  }
      end

      it "should create a listing" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :post => @attr
        response.should redirect_to(root_path)
      end

     # it "should have a flash message" do
     #   post :create, :listing => @attr
     #   flash[:success].should =~ /listing created/i
     # end
    end
  end
end
