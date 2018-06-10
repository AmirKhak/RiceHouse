Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#home'

  get '/home', to: 'home#home'
  get '/products', to: 'home#products'
  get '/about_us', to: 'home#about_us'
  get '/contact_us', to: 'home#contact_us'
  resources :user, only: [:index, :destroy, :edit]
  get '/user/:id', to: 'user#destroy'

end
