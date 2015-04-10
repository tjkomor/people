Rails.application.routes.draw do
  resources :people, :locations, :projects
  resources :location_interests do
    collection do
      post :build_location_and, :to => "location_interests#build_location_and_interest"
    end
  end
  resource  :dashboard
  resource  :resume
  root      'people#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#failure", as: :login_failure
  get '/login' => 'sessions#new', :as => :login
  get '/logout' => 'sessions#destroy', :as => :logout
end
