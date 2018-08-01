## Creates alongside to the devise gem documentation

Rails.application.routes.draw do
  ## path: '' ... is used to change routes. Previous was /users/sign_up
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  #get portfolio routes to change portfolios/:id to portoflio/:id in the show action. Rails knows when that when :id is a get route it is looking for params to pass to the show action
  resources :portfolios, expect: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
