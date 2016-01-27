Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1674303289504753', 'ff92d221814f4cb0c584296ee0c6650f'
end