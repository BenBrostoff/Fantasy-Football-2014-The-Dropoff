Rails.application.routes.draw do
  root 'dropoffs#index'
  get '/offense', to: 'dropoffs#offense', as: 'offense'
  get 'drafted/:id', to: 'dropoffs#drafted', as: 'drafted'
end
