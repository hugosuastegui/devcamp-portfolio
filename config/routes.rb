Rails.application.routes.draw do
  
  #get portfolio routes to change portfolios/:id to portoflio/:id in the show action. Rails knows when that when :id is a get route it is looking for params to pass to the show action
  resources :portfolios, expect: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
