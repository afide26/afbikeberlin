Rails.application.routes.draw do
  get 'index' => 'static_pages#index'

  get 'about' => 'static_pages#contact'

  get 'faq'   => 'static_pages#faq'

  root to:'static_pages#landing_page'

  #get 'static_pages/thank_you'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
