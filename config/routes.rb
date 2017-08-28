Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions do
    resources :answers
    resources :votes, :comments
  end

  resources :answers do
    resources :votes, :comments
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  root to: 'questions#index'
end
