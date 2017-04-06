require "rails_helper"

RSpec.feature "Create new message", type: :feature do
	scenario "client successfully creates new message" do
		@message = FactoryGirl.attributes_for(:message)
		@message[:client] = FactoryGirl.create(:client)
		@trainer = FactoryGirl.create(:trainer)

		login_as(@message[:client])
		visit "/messages/new"

		fill_in('body', with: @message[:body])
		select(@trainer.email, from: 'message_recipient')

		click_button('create-message')

		expect(page).to have_current_path(messages_path)
	end

	scenario "message is not successfully created" do
		@message = FactoryGirl.attributes_for(:invalid_message)
		@message[:client] = FactoryGirl.create(:client)
		@trainer = FactoryGirl.create(:trainer)

		login_as(@message[:client])
		visit "/messages/new"

		fill_in('body', with: @message[:body])
		select(@trainer.email, from: 'message_recipient')

		click_button('create-message')

		expect(page).to have_current_path(messages_path)
		expect(page).to have_button('create-message')
	end
end