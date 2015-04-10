GreaterThan::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  resources :topics
  resources :conversations
  resources :replies

  get 'profile' => 'profiles#show'
end
