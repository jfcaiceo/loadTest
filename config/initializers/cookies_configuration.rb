salt = Rails.application.credentials[:cookie_salt]

if salt.blank? && !Rails.env.test?
  raise ArgumentError, 'Setup cookie_salt value for Beetrack Auth.'\
                       'The value must exists in secrets.yml and credentials'
end

Rails.application.configure do
  config.action_dispatch.use_authenticated_cookie_encryption = true
  config.action_dispatch.authenticated_encrypted_cookie_salt = salt
  config.action_dispatch.cookies_serializer = :json
  if Rails::VERSION::MAJOR >= 6
    config.action_dispatch.use_cookies_with_metadata = false
  end
end
