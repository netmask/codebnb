Before('@omniauth_test') do
  OmniAuth.config.test_mode = true


  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid => '123545',
    :info => { :email => 'juan@test.com', :name => 'Juan Perez'}
  })

end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
