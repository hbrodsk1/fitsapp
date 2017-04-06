require "rails_helper"

RSpec.feature "new message click through", type: :feature do
	scenario 'user clicks chat link' do
		@client = FactoryGirl.create(:client)

		login_as(@client)
		visit "/messages"
		
		click_link('new-chat-button')
		expect(page).to have_current_path(new_message_path)
	end
end