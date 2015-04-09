require 'rails_helper'
require 'support/auth_helper'

RSpec.describe SessionsController, :type => :controller do
  include AuthHelper

  #login
  #create
  #logout
  describe "GET #new" do
    it "redirects if you're already authed" do
      login!
      get :new
      assert_redirected_to dashboard_path
    end

    it "redirects to GH if you're not authed" do
      get :new
      assert_redirected_to "http://test.host/auth/github"
    end
  end

  describe "GET #create" do
    it "sets current user based on GH data" do
      auth_data = {uid: 1234,
                   credentials: {token: "my-token"},
                   info: {nickname: "worace", email: "horace.d.williams@gmail.com"}}
      request.env["omniauth.auth"] = Hashie::Mash.new(auth_data)
      expect_any_instance_of(TuringAuth::User).to receive(:gh_teams).and_return(TuringAuth::TEAMS.values)
      get :create, provider: :github
      assert_redirected_to root_path
      assert @controller.current_user.is_a?(TuringAuth::User)
    end

    it "doesnt allow users who aren't part of a turing team" do
      auth_data = {uid: 1234,
                   credentials: {token: "my-token"},
                   info: {nickname: "worace", email: "horace.d.williams@gmail.com"}}
      request.env["omniauth.auth"] = Hashie::Mash.new(auth_data)

      expect_any_instance_of(TuringAuth::User).to receive(:gh_teams).and_return([])

      get :create, provider: :github

      assert_redirected_to root_path
      assert_nil @controller.current_user
    end
  end

  describe "GET #destroy" do
    it "clears the session" do
      login!
      refute_nil @controller.current_user
      get :destroy
      assert_redirected_to root_path
      assert_nil @controller.current_user
    end
  end
end
