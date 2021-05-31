Rails.application.routes.draw do
  devise_for :customers, except: [:index] do
    resources :offers, except: [:index]
  end

  devise_for :developers, except: [:edit, :update]

  resources :offers, only: [] do
    resources :proposals, only: [:new, :create]
  end

  resources :proposals, only: [:show, :delete]
  put '/accept_proposal', to: 'offers#accept_proposal', as: 'accept_proposal'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
