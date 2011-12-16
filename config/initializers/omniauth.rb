Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  provider :twitter, 'SVwve5yoifEnS7YPzSrRXg', 'qVmJUcVDOyGJZykPm8b7zt6HEDSHcGChM6ZSoMzMjc'
  #provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
  
end


Twitter.configure do |config|
  config.consumer_key       = "SVwve5yoifEnS7YPzSrRXg"
  config.consumer_secret    = "qVmJUcVDOyGJZykPm8b7zt6HEDSHcGChM6ZSoMzMjc"
  config.oauth_token        = "12505162-jXL0sOsVbGtsuS3RzrGck9Boft4I1JKLFOgGELnI"
  config.oauth_token_secret = "r7ZnyyJ63EnaZSHsU2HeFWwnT3QKn45NlJXbR5XFVU"
end