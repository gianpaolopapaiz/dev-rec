Rails.application.routes.draw do
  

  devise_for :customers, except: [:index]

  resources :customers, only: [:show] do
    resources :offers, except: [:index, :destroy]
  end
  
  devise_for :developers, except: [:edit, :update]
  resources :developers, only: [:show]
  
  get 'offer/:id/close_offer', to: 'offers#close_offer', as: 'close_offer'
  resources :offers, only: [:destroy] do
    resources :proposals, only: [:new, :create]
  end
  
  resources :proposals, only: [:show, :delete] do
    get '/accept_proposal', to: 'proposals#accept_proposal', as: 'accept_proposal'
  end
  

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
