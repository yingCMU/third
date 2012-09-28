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
      visit   new_post_path
      response.should be_success
    end

   # it "should prepare categories" do
    #  get :new
     # assigns(:categories).should_not be_nil
   # end
  end


  describe "POST 'create'" do
    login_user
    describe "failure" do

      before(:each) do
        @attr = { :place => "",  :details => "", :title=>"", :user_id=>11 }
      end
      it "should have a current_user" do
        # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
        subject.current_user.should_not be_nil
      end

      it "should not create a listing" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end

      it "should render the home page" do
        post :create, :post => @attr
       # response.should redirect_to(root_path)
     #   response.should render_template('/')
        response.should be_success
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :place => "",:title => "Lorem ipsum",
                  :details => "Lorem ipsum",          :user_id=>11
                  }
      end

      it "should create a listing" do
        lambda do
          post :create, :post => @attr
          #visit
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
