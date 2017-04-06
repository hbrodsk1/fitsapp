require "rails_helper"

RSpec.feature "log in/log out", type: :feature do
	scenario 'client logs in with valid credentials' do
		@client = FactoryGirl.create(:client)

		visit 'clients/sign_in'
		fill_in('Email', with: @client.email)
		fill_in('Password', with: @client.password)

		click_button('login-button')

		expect(page).to have_current_path(root_path)
	end

	scenario 'client logs in with invalid credentials' do
		@invalid_client = FactoryGirl.build(:invalid_client)

		visit 'clients/sign_in'
		fill_in('Email', with: @invalid_client.email)
		fill_in('Password', with: @invalid_client.password)

		click_button('login-button')

		expect(page).to have_current_path(new_client_session_path)
	end
end