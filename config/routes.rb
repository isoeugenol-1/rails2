Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
    end
  end
  get    'login'    ,to: 'users#new'
  get    'top'      ,to: 'blogs#top'
  get    '/blogs/confirm'  ,to: 'blogs#confirm'
  get    '/blogs'          ,to: 'blogs#index'
  post   '/blogs'          ,to: 'blogs#create'
  get    '/blogs/new'      ,to: 'blogs#new'
  get    '/blogs/:id/edit' ,to: 'blogs#edit'
  get    '/blogs/:id'      ,to: 'blogs#show'
  patch  '/blogs/:id'      ,to: 'blogs#update'
  delete '/blogs/:id'      ,to: 'blogs#destroy'
  get 'sessions/new'
  get 'favorites'         ,to: 'favorites#show'
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
end
