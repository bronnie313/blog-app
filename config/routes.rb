Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'users#index'
  end
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get '/users/:user_id/add_post', to: 'posts#add_post', as: 'add_user_post'
  get '/users/:user_id/add_comment', to: 'comments#add_comment', as: 'add_user_comment'
  post '/users/:user_id/add_comment', to: 'comments#create'
  resources :posts do
    member do
      post 'like',  to: 'likes#like'
    end
  end
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_user_post'
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'delete_user_comment' 
end
