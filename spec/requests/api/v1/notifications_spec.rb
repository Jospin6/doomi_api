require 'rails_helper'


RSpec.describe "api/v1/notifications", type: :request do
 
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Notification.create! valid_attributes
      get notifications_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      notification = Notification.create! valid_attributes
      get notification_url(notification), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Notification" do
        expect {
          post notifications_url,
               params: { notification: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Notification, :count).by(1)
      end

      it "renders a JSON response with the new notification" do
        post notifications_url,
             params: { notification: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Notification" do
        expect {
          post notifications_url,
               params: { notification: invalid_attributes }, as: :json
        }.to change(Notification, :count).by(0)
      end

      it "renders a JSON response with errors for the new notification" do
        post notifications_url,
             params: { notification: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested notification" do
        notification = Notification.create! valid_attributes
        patch notification_url(notification),
              params: { notification: new_attributes }, headers: valid_headers, as: :json
        notification.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the notification" do
        notification = Notification.create! valid_attributes
        patch notification_url(notification),
              params: { notification: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the notification" do
        notification = Notification.create! valid_attributes
        patch notification_url(notification),
              params: { notification: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested notification" do
      notification = Notification.create! valid_attributes
      expect {
        delete notification_url(notification), headers: valid_headers, as: :json
      }.to change(Notification, :count).by(-1)
    end
  end
end
