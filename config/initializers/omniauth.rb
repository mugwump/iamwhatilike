Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :twitter, 'SVwve5yoifEnS7YPzSrRXg', 'qVmJUcVDOyGJZykPm8b7zt6HEDSHcGChM6ZSoMzMjc'
  #provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
end