Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twiiter, "KEY", "SECRET"
end
