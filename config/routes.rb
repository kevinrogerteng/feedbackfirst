Feedbackfirst::Application.routes.draw do

  get "graphs/index"
  get "graphs/create"
  get "tags/index"
  get "categories/index"
  resources :posts 
  resources :sessions
  resources :graphs, only:[:index, :create]
  resources :categories, only:[:index]
  resources :tags, only:[:index]
  resources :tickets, only:[:index]
  resources :users, only:[:show]
  root to: "sites#index"

end
