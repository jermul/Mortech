require 'spec_helper'

describe "Static Pages" do

	describe "Home page" do
	  it "should have the content 'Mortech'" do
		  visit '/static_pages/home'
	    expect(page).to have_content('Mortech')
	  end

	  it "should have the title 'Home'" do
	  	visit '/static_pages/home'
	  	expect(page).to have_title("Mortech Manufacturing Inc. | Home")
	  end
	end
	
	describe "About page" do
		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("Mortech Manufacturing Inc. | About")
		end
	end
end

