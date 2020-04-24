Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: "registrations" }
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

  resources :posts, only: [:index, :create, :show, :destroy] do 
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
  end  
end
