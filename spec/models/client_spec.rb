require 'rails_helper'

RSpec.describe Client, type: :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:client)).to be_valid
  end

  it "has a valid trainer factory" do
  	expect(FactoryGirl.create(:trainer)).to be_valid
  end

  	context 'associations' do
  		it { is_expected.to have_many(:messages) }
  	end

  	context 'validations' do
		it { is_expected.to validate_presence_of(:email) }
		it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
		it { is_expected.to validate_presence_of(:password) }
		it { is_expected.to validate_presence_of(:role) }
		it { should validate_inclusion_of(:role).in_array(["user", "trainer"]) }
		it { is_expected.to validate_length_of(:password).is_at_least(5).is_at_most(30) }
	end	
end
