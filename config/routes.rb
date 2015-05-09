Rails.application.routes.draw do
  resources :users
  resource  :sms, only: [:create, :show]
  post "send" => "texts#send_texts"
  resource  :session, only: [:new, :create, :destroy]
  root      "welcome#index"
end