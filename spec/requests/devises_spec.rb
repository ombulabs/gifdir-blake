require 'rails_helper'

RSpec.describe "Devises", type: :request do
  context "when a user is not logged in , it should redirect to the login page and handle" do
    describe "GET /home" do
      it "should redirect to login page for non-logged in user" do
        get root_path
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response.body).to include("Log in")
      end

      it "should correctly allow logged in users to visit home page" do
        get root_path
        #sign_in @user
        #expect(response.body).to include("Log in")

      end
    end
  end
end
