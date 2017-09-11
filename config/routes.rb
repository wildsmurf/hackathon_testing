Rails.application.routes.draw do
  root to: 'static_pages#show'
  

  resources :posts do
    resources :comments
  end

  resources :bios
  devise_for :users

end
