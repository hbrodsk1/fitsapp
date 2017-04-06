require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #index" do
    context "client logged in" do
        login_client

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "correctly assigns @sent_messages" do
        @sent_messages = [FactoryGirl.create(:message, client_id: subject.current_client.id),
                          FactoryGirl.create(:message, client_id: subject.current_client.id)]

        get :index
        expect(assigns(:sent_messages)).to eq(@sent_messages)
      end

      it "correctly assigns @received_messages" do
        @received_messages = [FactoryGirl.create(:message, recipient: subject.current_client.id),
                          FactoryGirl.create(:message, recipient: subject.current_client.id)]

        get :index
        expect(assigns(:received_messages)).to eq(@received_messages)
      end
    end
  end

  describe "GET #new" do
    context "client logged in" do
        login_client
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end

      it "correctly assigns @message" do
        get :new
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "correctly assigns @recipients" do
        @recipients = Client.all

        get :new
        expect(assigns(:recipients)).to eq(@recipients)
      end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(:message_params) { FactoryGirl.attributes_for(:message) }

      login_client

      it "creates a new message" do
        expect { post :create, params: { :message => message_params } }.to change(Message, :count).by(1)
      end

      it "should increase the client's message count by one" do
        expect { post :create, params: { :message => message_params } }.to change(subject.current_client.messages, :count).by(1)
      end

      it "redirects to client page" do
        post :create, params: { :message => message_params }
        expect(response).to redirect_to(messages_path)
      end
    end

    context "with invalid attributes" do
      let(:client) { FactoryGirl.create(:client) }
      let(:invalid_message_params) { FactoryGirl.attributes_for(:invalid_message) }

      login_client

      it "does not create a new message" do
        expect { post :create, params: { id: client, :message => invalid_message_params } }.to_not change(Message, :count)
      end

      it "renders the new template" do
        post :create, params: { id: client, :message => invalid_message_params }
        expect(response).to render_template('new')
      end
    end
  end
end
