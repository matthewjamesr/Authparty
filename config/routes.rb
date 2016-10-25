Rails.application.routes.draw do
  root 'welcome#index'

  get 'send_sms' => 'verifications#create'
  get 'verify' => 'verifications#confirm_code'
  patch 'verify' => 'verifications#confirm_accepted'

  get 'broadcast' => 'verifications#confirm_broadcast'

  resources :accounts
end
