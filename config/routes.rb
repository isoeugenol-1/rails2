Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
    end
  end
  get    'top'      ,to: 'blogs#top'
  get    '/blogs/confirm'  ,to: 'blogs#confirm'
  get    '/blogs'          ,to: 'blogs#index'
  post   '/blogs'          ,to: 'blogs#create'
  get    '/blogs/new'      ,to: 'blogs#new'
  get    '/blogs/:id/edit' ,to: 'blogs#edit'
  get    '/blogs/:id'      ,to: 'blogs#show'
  patch  '/blogs/:id'      ,to: 'blogs#update'
  delete '/blogs/:id'      ,to: 'blogs#destroy'
  resources :blogs
end
