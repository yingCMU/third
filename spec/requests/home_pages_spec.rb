require 'spec_helper'

describe "home pages" do

  describe "Home page" do

    it "should have the h1 'TartanParty'" do
      visit '/home_pages/home'
      page.should have_selector('h1', :text => 'TartanParty')
    end

    it "should have the title 'Ying Li's App|TartanParty'" do
      visit '/home_pages/home'
      page.should have_selector('title',
                                :text => "Ying Li's App|TartanParty")
    end
  end



end