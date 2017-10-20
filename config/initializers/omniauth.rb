OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, '133190530669055', 'c1ec8a1f2fac4e4ea265f0cff05b4d44', scope: 'public_profile, email', info_fields: 'id,first_name,middle_name,last_name,email,name,link'
end