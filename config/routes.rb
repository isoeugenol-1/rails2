Rails.application.routes.draw do
  get    'login'    ,to: 'users#new'
  get    'top'      ,to: 'blogs#top'
  get    '/blogs/confirm'  ,to: 'blogs#confirm'
  get 'sessions/new'
  get 'favorites'         ,to: 'favorites#show'
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
