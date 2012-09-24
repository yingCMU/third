require 'spec_helper'

describe "post pages" do

  subject { page }

 # before { new_user_session_path user }


   # before { visit new_post_path }
  #  before { new_user_session_path}

  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_selector('h2',    text: 'Sign up') }
    it { should have_selector('label', text: 'Email') }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        # fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user11@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user and a new post" do
        expect { click_button submit }.to change(User, :count).by(1)
        #单独拿出一个decribe的话，跳不到posts/new page
        visit '/posts/new'
        expect { click_button "Create Post" }.to change{Post.count}.by(1)
      end
    end


  end
  # it "Create a new post" do
     # visit '/posts/new'

     # fill_in "place",          :with => "SomeTitle"

    #  fill_in "Description",    :with => "SomeDescription"

    #  select "books",            :from => "listing_category_id"

      #click_button             "Create Post"

   # Eend.should change(Post, :count).by(1)
   #   expect { click_button "Create Post" }.to change{Post.count}.by(1)


      end


