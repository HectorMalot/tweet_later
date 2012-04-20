Before('@omniauth-success') do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
        "provider" => 'twitter',
        "uid" => '123545',
        "info" => {
          "name" => "test user",
          "nickname" => "testuser"
        },
        "credentials" => {
          "token" => '12345',
          "secret" => '12345'
        }
      }
end

Before('@omniauth-failure') do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = :authentication_failed
end

After('@omniauth-success', '@omniauth-failure') do
  OmniAuth.config.test_mode = false
end