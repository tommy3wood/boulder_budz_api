Rails.application.routes.draw do
  namespace :api do
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get '/questions' => 'questions#index'
    post '/questions' => 'questions#create'
    get '/questions/:id' => 'questions#show'
    patch '/questions/:id' => 'questions#update'
    delete '/questions/:id' => 'questions#destroy'

    get '/answers' => 'answers#index'
    post '/answers' => 'answers#create'
    get '/answers/:id' => 'answers#show'
    patch '/answers/:id' => 'answers#update'
    delete '/answers/:id' => 'answers#destroy'

    post '/sessions' => 'sessions#create'
  end
end
