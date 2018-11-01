Rails.application.routes.draw do
  get    '/blogs'          ,to: 'blogs#index'
  post   '/blogs'          ,to: 'blogs#create'
  get    '/blogs/new'      ,to: 'blogs#new'
  get    '/blogs/:id/edit' ,to: 'blogs#new'
  get    '/blogs/:id'      ,to: 'blogs#show'
  patch  '/blogs/:id'      ,to: 'blogs#update'
  delete '/blogs/:id'      ,to: 'blogs#destroy'
  resources :blogs
end
