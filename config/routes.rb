Rails.application.routes.draw do
  root "tops#index"
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :tops, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :favorites
  #mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
