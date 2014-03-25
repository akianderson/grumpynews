# Change this omniauth configuration to point to your registered provider
# Since this is a registered application, add the app id and secret here
APP_ID = 'fc032ca4ef406ef146fc1b2f9420f76d'
APP_SECRET = 'd913dbeb364df0a4094ab1fb467abcc6e4c954dd0039699e'

CUSTOM_PROVIDER_URL = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :grumpy, APP_ID, APP_SECRET
end
