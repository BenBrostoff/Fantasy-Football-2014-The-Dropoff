Rails.application.routes.draw do
  root 'dropoffs#index'
  get 'drafted/:id', to: 'dropoffs#drafted', as: 'drafted'
end
