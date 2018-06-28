Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'home#home'

  get '/home', to: 'home#home'
  get '/about_us', to: 'home#about_us'
  get '/contact_us', to: 'home#contact_us'

  resources :user, only: [:index, :destroy, :edit]

  get '/user/:id', to: 'user#destroy'

  resources :product, only: [:index, :create, :show, :destroy, :new, :edit, :update, :rate]

  get '/product/:id', to: 'product#destroy'
  get '/product', to: 'product#create'
  get '/product/rate/:id/:rate', to: 'product#rate'

  namespace 'api' do
    namespace 'v1' do
      resources :product
    end
  end

end
