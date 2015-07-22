Rails.application.routes.draw do
  resources :articles

  root 'articles#index'

  resources :articles do
    resources :comments
  end
end
