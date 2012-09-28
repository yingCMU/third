require 'spec_helper'

describe HomePagesController  ,:type => :controller do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end



end
