if Rails.env.development?
  require './db/seeds/development'
end

require './db/seeds/production'
