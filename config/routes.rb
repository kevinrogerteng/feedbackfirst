Feedbackfirst::Application.routes.draw do

  resources :posts 
  resources :sessions
  resources :tickets, only:[:index]
  resources :users, only:[:show]
  root to: "sites#index"

end
