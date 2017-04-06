require 'rails_helper'

RSpec.describe Message, type: :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:message)).to be_valid
  end

  	context 'associations' do
  		it { is_expected.to belong_to(:client) }
  	end

  	context 'validations' do
		it { is_expected.to validate_presence_of(:body) }
		it { is_expected.to validate_presence_of(:recipient) }
		it { is_expected.to validate_presence_of(:client_id) }
		it { is_expected.to validate_length_of(:body).is_at_least(1).is_at_most(1000) }
	end
end
