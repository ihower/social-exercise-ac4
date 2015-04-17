Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1426426247662240', '5f4606707807fe24595e64bc7fe74213'
end