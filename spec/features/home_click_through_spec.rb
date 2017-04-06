require "rails_helper"

RSpec.feature "home click through", type: :feature do
	scenario 'user clicks chat link' do
		@client = FactoryGirl.create(:client)

		login_as(@client)
		visit "/home"
		
		click_link('chat-button')
		expect(page).to have_current_path(messages_path)
	end
end