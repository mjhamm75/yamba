require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe 'signin page' do
    before { visit signin_path }
    
    it { should have_selector('h1',	text: 'Sign In') }
    it { should have_selector('title', 	text: 'Sign In') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_selector('title', text: 'Sign In') }
      it { should have_selector('div.flash.error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", 	with: user.email
	fill_in "Password", 	with: user.password
	click_button "Sign In"
      end
    
    describe "followed by signout" do
      before { click_link "Sign Out" }
      it { should have_link('Sign In') }
    end

    it { should have_selector('title', text: user.name) }
    it { should have_link('Profile', href: user_path(user)) }
    it { should have_link('Sign Out', href: signout_path) }
    it { should_not have_link('Sign In', href: signin_path) }

    end
  end
end
