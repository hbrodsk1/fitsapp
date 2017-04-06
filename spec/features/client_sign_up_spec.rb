require 'rails_helper'

RSpec.feature "client sign up", type: :feature do
	scenario 'with valid credentials' do
		@client = FactoryGirl.attributes_for(:client)

		visit 'clients/sign_up'
		fill_in('Email', with: @client[:email])
		fill_in('Password', with: @client[:password])
		fill_in('Password confirmation', with: @client[:password])
		select(@client[:role], from: 'client_role')

		click_button('sign-up-button')

		expect(page).to have_current_path(home_path)
	end

	scenario 'with invalid credentials' do
		@invalid_client = FactoryGirl.attributes_for(:invalid_client)

		visit 'clients/sign_up'
		fill_in('Email', with: @invalid_client[:email])
		fill_in('Password', with: @invalid_client[:password])
		select(@invalid_client[:role], from: 'client_role')

		click_button('sign-up-button')

		expect(page).to have_current_path(client_registration_path)
		expect(page).to have_selector(:link_or_button, 'sign-up-button')
	end
end