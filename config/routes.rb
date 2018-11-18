Rails.application.routes.draw do
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :tops
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
