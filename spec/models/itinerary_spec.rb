require 'spec_helper'

describe Itinerary do

  let(:user) { FactoryGirl.create(:user) }
  before { @itinerary = user.itineraries.build(content: "Lorem ipsum") }

  subject { @itinerary }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @itinerary.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @itinerary.content = " " }
    it { should_not be_valid }
  end
end
