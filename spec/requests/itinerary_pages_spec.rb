require 'spec_helper'

describe "Itinerary pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "itinerary creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a itinerary" do
        expect { click_button "Post" }.not_to change(Itinerary, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'itinerary_content', with: "Lorem ipsum" }
      it "should create a itinerary" do
        expect { click_button "Post" }.to change(Itinerary, :count).by(1)
      end
    end
  end

  describe "itinerary destruction" do
    before { FactoryGirl.create(:itinerary, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete an itinerary" do
        expect { click_link "delete" }.to change(Itinerary, :count).by(-1)
      end
    end
  end
end