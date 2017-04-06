module ControllerMacros
	def login_client
	    before(:each) do
	      @request.env["devise.mapping"] = Devise.mappings[:client]
	      client = FactoryGirl.create(:client)
	      sign_in client
	    end
  	end
end