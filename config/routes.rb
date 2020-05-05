Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'signout', to: 'sessions#destroy'
  end

  get 'dashboard', to: 'dashboard#index'
  # get 'participant/:id/settle', to: 'participants#settle'

  resources :bills_participant

    resources :bills do
    collection { post :import }
  end

    resources :participants do
    collection { post :import }
  end

  root to: 'dashboard#index'
end
