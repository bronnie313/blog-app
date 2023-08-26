Rails.application.routes.draw do
  root to: redirect('/users')
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
end
