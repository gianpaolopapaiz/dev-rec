Rails.application.routes.draw do
  devise_for :customers, except: [:index] do
  end
  resources :customers, only: [:show] do
    resources :offers, except: [:index, :destroy]
  end

  devise_for :developers, except: [:edit, :update]

  resources :offers, only: [:destroy] do
    resources :proposals, only: [:new, :create]
  end

  resources :proposals, only: [:show, :delete]
  put '/accept_proposal', to: 'offers#accept_proposal', as: 'accept_proposal'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
