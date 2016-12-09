
#OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['VK_KEY'], ENV['VK_SECRET'], scope: 'email'
end

OmniAuth.config.test_mode = true

