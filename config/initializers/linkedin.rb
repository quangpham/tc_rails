LinkedIn.configure do |config|
  config.token = ENV["LINKEDIN_API_KEY"]
  config.secret = ENV["LINKEDIN_SECRET_KEY"]
end