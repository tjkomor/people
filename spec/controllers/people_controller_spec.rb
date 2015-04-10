require 'rails_helper'
require 'support/auth_helper'

RSpec.describe PeopleController, :type => :controller do
  include AuthHelper
  render_views
  describe "GET #new" do
    it "requires login" do
      get :new
      assert_redirected_to login_path
    end

    it "shows the form" do
      login!
      get :new
      assert_response :success
      assert_select "form"
    end
  end

  describe "POST #create" do
    it "requires login" do
      post :create, person: person_params
      assert_redirected_to login_path
    end

    it "creates a person if you are logged in" do
      refute Person.any?
      login!
      post :create, person: person_params
      assert_redirected_to person_path(Person.last)
      assert_equal Person.last.user_github_id, @controller.current_user.github_id
    end
  end

  describe "GET #edit" do
    let(:person) { Person.create(person_params.merge(user_github_id: sample_user.github_id)) }

    it "requires login" do
      get :edit, id: person.id
      assert_redirected_to login_path
    end

    it "shows the form" do
      login!
      get :edit, id: person.id
      assert_response :success
      assert_select "form"
    end
  end

  describe "PUT #update" do
    let(:person) { Person.create(person_params.merge(user_github_id: sample_user.github_id)) }

    it "requires login" do
      put :update, id: person.id, person: person_params.merge({first_name: "edited"})
      assert_redirected_to login_path
      refute_equal person.reload.first_name, "edited"
    end

    it "edits the person if you are logged in" do
      login!
      put :update, id: person.id, person: person_params.merge({first_name: "edited"})
      assert_redirected_to person_path(person.reload)
      assert_equal person.reload.first_name, "edited"
    end
  end
end
