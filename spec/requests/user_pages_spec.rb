require 'spec_helper'
 require 'factory_girl_rails'
describe "User pages" do

  subject { page }

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
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  end
  describe "profile page" do
    # Code to make a user variable
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

   # it { should have_selector('h3',    text: "All my posts") }
    it { should have_selector('b', text: "My Email:") }
  end




end