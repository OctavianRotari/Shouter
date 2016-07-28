Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
  end

  root to: "home#show", via: :get

  resource :dashboard, only: [:show]
  resource :search, only: [:show]
  resources :users, only: [:show, :index] do 
    post 'follow' => 'following_relationships#create'
    delete 'unfollow' => 'following_relationships#destroy'
  end
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]

  resources :hashtags, only: [:show]

end
