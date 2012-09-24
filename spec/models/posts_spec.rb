require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @post = post.new(title: "post title", user_id: user.id)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        post.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    describe "when user_id is not present" do
      before { @post.user_id = nil }
      it { should_not be_valid }
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
