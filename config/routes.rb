Feedbackfirst::Application.routes.draw do

  get "categories/index"
  resources :posts 
  resources :sessions
  resources :categories, only:[:index]
  resources :tickets, only:[:index]
  resources :users, only:[:show]
  root to: "sites#index"

end
