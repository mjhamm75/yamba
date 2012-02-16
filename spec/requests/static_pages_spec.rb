require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit root_path
      page.should have_content('Sample App')
    end

    it "should have the title 'Home'" do
      visit root_path
      page.should have_selector('title', :text => 'Home')
    end
  end

  describe "Help page" do 
    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title', :text => 'Help')
    end
  end

  describe "Help page" do 
    it "should have the content 'About'" do
      visit about_path
      page.should have_content('About')
    end

    it "should have the title 'About'" do
      visit about_path
      page.should have_selector('title', :text => 'About')
    end
  end

  describe "Contact page" do 
    it "should have the content 'Contact'" do
      visit contact_path
      page.should have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', :text => 'Contact')
    end
  end
end
