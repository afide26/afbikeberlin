Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]

  root 'static_pages#landing_page'

  get 'about'   => 'static_pages#about'

  get 'index'   => 'static_pages#index'

  get 'landing' => 'products#landing_page'

  get 'contact' => 'static_pages#contact'

  get 'faq'     => 'static_pages#faq'

  post 'static_pages/thank_you'

  post 'payments/create'
end