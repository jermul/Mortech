require 'spec_helper'

describe "Static Pages" do

	subject { page }

	describe "Home page" do
		before { visit root_path }

	  it { should have_content('Mortech') }
	  it { should have_title(full_title('')) }
	  it { should_not have_title('| Home') }

	  describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:itinerary, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:itinerary, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
	end
	
	describe "About page" do
		before { visit about_path }
		
		it { should have_content('About Us') }
		it { should have_title(full_title('About')) }
	end

	describe "Contact page" do
		before { visit contact_path }
		
		it { should have_content('Contact Us') }
		it { should have_title(full_title('Contact')) }
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About'))
		click_link "Contact"
		expect(page).to have_title(full_title('Contact'))
		click_link "Home"
		click_link "Sign up now!"
		expect(page).to have_title(full_title('Sign up'))
	end
end

