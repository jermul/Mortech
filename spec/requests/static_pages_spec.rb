require 'spec_helper'

describe "Static Pages" do

	let(:title) { "Mortech Manufacturing Inc."}

	describe "Home page" do
	  it "should have the content 'Mortech'" do
		  visit '/static_pages/home'
	    expect(page).to have_content('Mortech')
	  end

	  it "should have the base title" do
	  	visit '/static_pages/home'
	  	expect(page).to have_title("Mortech Manufacturing Inc.")
	  end

	  it "should not have a custom page title" do
	  	visit '/static_pages/home'
	  	expect(page).not_to have_title('| Home')
	  end
	end
	
	describe "About page" do
		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("#{title} | About")
		end
	end

	describe "Contact page" do
		it "should have the content 'Contact Us'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact Us')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("#{title} | Contact")
		end
	end
end

