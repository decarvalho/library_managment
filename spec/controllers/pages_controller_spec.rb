# spec/controllers/your_controller_spec.rb
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }

  describe "GET #home" do
    context "when authenticated" do
      before { sign_in user }

      it "allows access" do
        get :home
        expect(response).to have_http_status(:success)
      end
    end

    context "when unauthenticated" do
      it "redirects to login" do
        get :home
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
