TuringAuth.admin_token = ENV["TURING_AUTH_ADMIN_TOKEN"]
TuringAuth.client_id = ENV['PEOPLE_GITHUB_ID']
TuringAuth.client_secret = ENV['PEOPLE_GITHUB_SECRET']
#TuringAuth.init! #init omniauth extensions

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, TuringAuth.client_id, TuringAuth.client_secret, provider_ignores_state: true
end

