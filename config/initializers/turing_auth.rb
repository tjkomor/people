TuringAuth.admin_token = ENV["TURING_AUTH_ADMIN_TOKEN"]
TuringAuth.client_id = ENV['PEOPLE_GITHUB_ID']
TuringAuth.client_secret = ENV['PEOPLE_GITHUB_SECRET']
TuringAuth.init! #init omniauth extensions
