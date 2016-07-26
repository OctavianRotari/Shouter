Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
  end

  root to: "home#show", via: :get

  resource :dashboard, only: [:show]
  resources :users, only: [:show]
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]

end
